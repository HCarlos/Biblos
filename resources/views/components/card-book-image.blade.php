        <div class="col-12 col-md-4 px-0 mb-2 mb-md-0">
            <div class="ccard h-100 pt-2 pb-25 px-25 d-flex mx-2 overflow-hidden">
                <div class="position-br	mb-n5 mr-n5 radius-round bgc-purple-l3 opacity-3" style="width: 5.25rem; height: 5.25rem;"></div>
                <div class="position-br	mb-n5 mr-n5 radius-round bgc-purple-l2 opacity-5" style="width: 4.75rem; height: 4.75rem;"></div>
                <div class="position-br	mb-n5 mr-n5 radius-round bgc-purple-l1 opacity-5" style="width: 4.25rem; height: 4.25rem;"></div>
                <div class="flex-grow-1 pl-25 pos-rel d-flex flex-column">
                    <div class="align-self-center pos-rel text-blue">
                        <div class="flex-grow-1 mb-3">
                            <div class="text-justify text-20 text-dark-l2 ">
                                {{ $item->id.' '.$item->libros->last()->titulo }}
                            </div>
                        </div>

                        <a class="pull-left pl-2"  href="{{asset($item->PathImage ?? '/images/web/file-not-found.png' )}}" target="_blank" >
                            <img class="media-object" src="{{asset($item->PathImage ?? '/images/web/file-not-found.png' )}}" width="100" height="128" >
                        </a>
                    </div>
                    <div class="ml-auto pr-1 align-self-center pos-rel text-125 float-right">
                        @include('share.bars.___removeItem')
                    </div>
                </div>
            </div>
        </div>
