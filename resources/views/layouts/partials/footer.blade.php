<footer class="footer d-none d-sm-block">
    <div class="footer-inner bgc-white-tp1">
        <div class="pt-3 border-none border-t-3 brc-grey-l2 border-double">
            <span class="text-primary-m1 font-bolder text-120">{{ config('ibt.nombre_software') }}</span>
            <span class="text-grey">{{ config('app.name_company') }} &copy; {{date('Y')}}</span>

            <span class="mx-3 action-buttons">
{{--                      <a href="#" class="text-blue-m2 text-150"><i class="fab fa-twitter-square"></i></a>--}}
                      <a href="https://www.facebook.com/{{config('ibt.pagina_facebook')}}" class="text-blue-d2 text-150"><i class="fab fa-facebook"></i></a>
{{--                      <a href="#" class="text-orange-d1 text-150"><i class="fa fa-rss-square"></i></a>--}}
            </span>
        </div>
    </div><!-- .footer-inner -->

    <!-- `scroll to top` button inside footer (for example when in boxed layout) -->
    <div class="footer-tools">
        <a href="#" class="btn-scroll-up btn btn-dark mb-2 mr-2">
            <i class="fa fa-angle-double-up mx-2px text-95"></i>
        </a>
    </div>
</footer>
