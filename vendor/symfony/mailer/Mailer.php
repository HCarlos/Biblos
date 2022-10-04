<?php

/*
 * This file is part of the Symfony package.
 *
 * (c) Fabien Potencier <fabien@symfony.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace Symfony\Component\Mailer;

use Psr\EventDispatcher\EventDispatcherInterface;
use Symfony\Component\EventDispatcher\Event;
use Symfony\Component\EventDispatcher\LegacyEventDispatcherProxy;
use Symfony\Component\Mailer\Event\MessageEvent;
use Symfony\Component\Mailer\Exception\TransportExceptionInterface;
use Symfony\Component\Mailer\Messenger\SendEmailMessage;
use Symfony\Component\Mailer\Transport\TransportInterface;
use Symfony\Component\Messenger\Exception\HandlerFailedException;
use Symfony\Component\Messenger\MessageBusInterface;
use Symfony\Component\Mime\RawMessage;
use Symfony\Contracts\EventDispatcher\EventDispatcherInterface as SymfonyEventDispatcherInterface;

/**
 * @author Fabien Potencier <fabien@symfony.com>
 */
final class Mailer implements MailerInterface
{
    private $transport;
    private $bus;
    private $dispatcher;

    public function __construct(TransportInterface $transport, MessageBusInterface $bus = null, EventDispatcherInterface $dispatcher = null)
    {
        $this->transport = $transport;
        $this->bus = $bus;
        $this->dispatcher = class_exists(Event::class) && $dispatcher instanceof SymfonyEventDispatcherInterface ? LegacyEventDispatcherProxy::decorate($dispatcher) : $dispatcher;
    }

    public function send(RawMessage $message, Envelope $envelope = null): void
    {
        if (null === $this->bus) {
            $this->transport->send($message, $envelope);

            return;
        }

        if (null !== $this->dispatcher) {
            // The dispatched event here has `queued` set to `true`; the goal is NOT to render the message, but to let
            // listeners do something before a message is sent to the queue.
            // We are using a cloned message as we still want to dispatch the **original** message, not the one modified by listeners.
            // That's because the listeners will run again when the email is sent via Messenger by the transport (see `AbstractTransport`).
            // Listeners should act depending on the `$queued` argument of the `MessageEvent` instance.
            $clonedMessage = clone $message;
            $clonedEnvelope = null !== $envelope ? clone $envelope : Envelope::create($clonedMessage);
            $event = new MessageEvent($clonedMessage, $clonedEnvelope, (string) $this->transport, true);
            $this->dispatcher->dispatch($event);
        }

        try {
            $this->bus->dispatch(new SendEmailMessage($message, $envelope));
        } catch (HandlerFailedException $e) {
            foreach ($e->getNestedExceptions() as $nested) {
                if ($nested instanceof TransportExceptionInterface) {
                    throw $nested;
                }
            }
            throw $e;
        }
    }
}
