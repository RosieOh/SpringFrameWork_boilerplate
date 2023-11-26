function goTop() {
    $('body, html').animate({ scrollTop: 0 }, 500);
}

function goLink(target,M) {
    var T = $("[data-link="+target+"]").offset().top;
    var headerH = $("#header").outerHeight();
    if(M==0){
        var C = $("#header .wrapHide").outerHeight();
    }else if(M==1){
        var tabH = $("#contents .linkNavWrap").outerHeight();
        var C = tabH + headerH;
    }else{
        var C = 0;
    }

    var V = T-C;
    $('body, html').animate({ scrollTop: V }, 500);
}

//tab
$(function(){
    $(".tab_idx.over > li").each(function () {
    }).mouseenter(function () {
        var n = $(this).index();
        $(this).parents(".wrap_idx").find(".con_idx .idx").removeClass("on");
        $(this).parents(".wrap_idx").find(".con_idx .idx:eq("+n+")").addClass("on");
        $(this).parents(".wrap_idx").find(".tab_idx > li").removeClass("on");
        $(this).addClass("on");
    });
    $(".tab_idx.click > li").each(function () {
    }).click(function () {
        var n = $(this).index();
        $(this).parents(".wrap_idx").find(".con_idx .idx").removeClass("on");
        $(this).parents(".wrap_idx").find(".con_idx .idx:eq("+n+")").addClass("on")
        $(this).parents(".wrap_idx").find(".tab_idx > li").removeClass("on");
        $(this).addClass("on");
    });
});

//pop
function layerOpen(url){
    var bg = '<div class="layerBg"></div>'
    var frame ='<iframe class="layerFrame" src="'+url+'" frameborder="0" scrolling="no" allowtransparency="true"></iframe>'
    var wrap = '<div class="layerWrap" tabindex="0">'+bg+frame+'</div>'
    layerTarget = event.currentTarget;
    $("body").append(wrap);
    $(".layerWrap").addClass("on").focus();
    $("html").addClass("layerOn");

};
function layerClose(layerTarget){
    // parent.location.reload()
    $(".layerWrap").remove()
    $("html").removeClass("layerOn");
    parent.layerTarget.focus();
};

function popOpenC(u,w,h){
    var winW = window.screen.width;
    var winH = window.screen.height;
    var L = (winW-w)/2
    var T = (winH-h)/2
    window.open(u,'','width='+w+',height='+h+',left='+L+',top='+T+', status=no, toolbar=no, menubar=no, location=no, scrollbars=no')
}
function layerImg(src,no){
    var img = $(".layerImg[data-no='"+no+"']").attr("src");
    var tit = $(".layerImgTit[data-no='"+no+"']").text();
    var src = src+"?img="+img+"&tit="+tit+"";
    layerOpen(src);
}
function toggleClass(obj,wrap,Class,type){
    if(wrap == "html"){
        $("html").toggleClass("hidden");
    };
    if(!wrap){
        var wrap = (".toggleWrap");
    };
    if(!Class){
        var Class = "on";
    };
    if(type == 0){
        $(obj).parents(wrap).addClass(Class);
        $(obj).parents(wrap).siblings("").removeClass(Class);
    }else if(type == 1){
        $(obj).parents(wrap).toggleClass(Class);
    }else{
        $(obj).parents(wrap).toggleClass(Class);
        $(obj).parents(wrap).siblings("").removeClass(Class);
    }
};

function swiperEach(){
    $(".swiperEach").each(function(){
        var sliderLabel = $(this).data("label");
        var sliderDir = $(this).data("dir");
        var sliderPV = $(this).data("pv");
        var sliderMotion = $(this).data("motion");
        var sliderLoop = $(this).data("loop");
        var sliderSpeed = $(this).data("speed");
        var ww = $(this).outerWidth()
        var sw = $(this).find(".swiper-slide").outerWidth()
        var cc = ww / sw;
        var L = $(this).find(".swiper-slide").length;
        if(sliderDir){
            var sliderDir = 'vertical';
        }else{
            var sliderDir = 'horizontal';
        }
        if(!sliderMotion){
            var sliderMotion = 'slide';
        }
        if(!sliderSpeed){
            var sliderSpeed = 4000;
        }
        if(!sliderPV){
            var sliderPV = 'auto';
        }
        if(!sliderLoop){
            var sliderLoop = L > cc;
        }
        var wS = '.swiperEach[data-label="'+sliderLabel+'"]'
        var wC = '.swiperBtn.'+sliderLabel+''
        var slider = new Swiper(wS, {
            slidesPerView: sliderPV,
            effect: sliderMotion,
            direction: sliderDir,
            speed: 500,
            //loop: L >= 2,
            loop: sliderLoop,
            autoplay: {
                delay: sliderSpeed,
                disableOnInteraction: false,
            },
            pagination: {
                el: wC + ' .paging',
                //type: 'progressbar',
                clickable: true,
            },
            navigation: {
                nextEl: wC + '.next',
                prevEl: wC + '.prev',
            },
            on: {
                init: function () {
                    $(wC +' .total .all').text(L);
                },
                slideChangeTransitionStart: function () {
                    var IDX = this.realIndex;
                    if($(wC +' .total').length > 0){
                        $(wC +' .total .this').text(IDX + 1);
                    }
                },
            }
        });
        $(wC +'.pause').click(function(){
            $(this).parent(".swiperPauseWrap").addClass("pause");
            document.querySelector(wS).swiper.autoplay.stop();
        });
        $(wC +'.play').click(function(){
            $(this).parent(".swiperPauseWrap").removeClass("pause");
            document.querySelector(wS).swiper.autoplay.start();
        });
    })
};

scrollLoad();
function scrollLoad(evt){
    window.addEventListener('load', function() {
        $("html").addClass("load");
        onScroll(evt);
    });
    document.addEventListener('scroll', function() {
        onScroll(evt);
    });
    var latestKnownScrollY = 0,
        ticking = false;
    function onScroll(evt) {
        latestKnownScrollY = document.documentElement.scrollTop;
        requestTick();

    }
    function requestTick() {
        if(!ticking) {
            requestAnimationFrame(update);
        }
        ticking = true;
    }
    function update() {
        ticking = false;
        if(latestKnownScrollY > 0){
            $("html").addClass("scroll");
        }else{
            $("html").removeClass("scroll");
        }
        if(evt){
            evtStart(evt);
        }

    }
    function evtStart(evt){
        var evtArr = evt.split(" ")
        var fcObj = {}
        fcObj.pageScrollAni = function(){
            var aniObj = $(".scrollAni");
            var winH = $(window).height();
            aniObj.each(function(){
                var TO = $(this);
                var T = TO.offset().top;
                var TH = TO.outerHeight();
                var scrollP = T - (winH*.8);
                var scrollM = T + TH;
                if(T < winH){
                    TO.addClass("on").addClass("start");
                }else if(latestKnownScrollY > scrollP && latestKnownScrollY < scrollM){
                    TO.addClass("on");
                }
                if(latestKnownScrollY == 0){
                    TO.not(".start").removeClass("on");
                }
            });
        }
        fcObj.history = function(){
            var aniObj = $(".hObj");
            var winH = $(window).height();
            aniObj.each(function(){
                var TO = $(this);
                var T = TO.offset().top;
                var TH = TO.outerHeight();
                var scrollP = T - (winH*.6);
                var scrollM = T + TH;
                if(latestKnownScrollY > scrollP && latestKnownScrollY + (winH*.6) < scrollM){
                    TO.addClass("on");
                }else{
                    TO.removeClass("on");
                }

            });
        }
        fcObj.pageScrollLink = function(){
            var obj = $(".linkScroll");
            var winH = $(window).height();
            var fixH = $("#header").outerHeight() + $("#contents .sub_tab").outerHeight();
            obj.each(function(){
                var idx = $(this).data("no");
                var objT = $(this).offset().top;
                var objH = $(this).outerHeight();
                if(latestKnownScrollY + fixH > objT && latestKnownScrollY + fixH < (objT+objH)){
                    $(".linkNav[data-no='"+idx+"']").addClass("on");
                    $("html").addClass("on-"+idx);
                }else{
                    $(".linkNav[data-no='"+idx+"']").removeClass("on");
                    $("html").removeClass("on-"+idx);
                }
                if(latestKnownScrollY + winH > objT+objH){
                    $(".linkScroll[data-no='"+idx+"']").addClass("bottom");
                }else{
                    $(".linkScroll[data-no='"+idx+"']").removeClass("bottom");
                }
            })
        }
        fcObj.footerCheck = function(){
            var ft = $("#footer").offset().top;
            var VA = latestKnownScrollY + $(window).height();
            if(VA > ft){
                $("html").addClass("footerCheck");
            }else{
                $("html").removeClass("footerCheck");
            }
        }
        for(var i=0; i < evtArr.length; i++){
            fcObj[evtArr[i]]();
        }
    }
}
function addClass(obj,wrap,check){
    $(obj).addClass("on");
    $(obj).siblings("").removeClass("on");
    if(wrap){
        $("."+wrap+"").addClass("on");
        if(check){
            $("."+check+"").not("."+wrap+"").removeClass("on");
        }
    }
}
function telLink(obj,d){
    var n = $(obj).data("link");
    if(d == 0){
        var n = "02-" + n;
    }
    $(obj).attr("href","tel:"+n+"")
}
function mailLink(obj){
    var mail = $(obj).data("link");
    window.location = "mailto:"+mail+"";
}
function drowSvg(v){
    if(v){
        var obj = $(v);
    }else{
        var obj = $(".svg");
    }
    var mySVG = obj.drawsvg();
    mySVG.drawsvg('animate');

}
function svgHover(){
    $(".svgHover").mouseenter(function(){
        var obj = $(this).find("svg");
        drowSvg(obj)
    })
}
function aniNum(obj){
    if(!obj){ var obj = '.aniNum';};
    $(obj).counterUp({
        delay: 50,
        time: 1000
    });
}
//
$(function(){
    $(document).on("focusin", function(e) {
        if (!$(".actW").is(e.target) && $(".actW").has(e.target).length === 0) {
            $(".actW").removeClass("act");
        }
    });
    $(".actW").on("mouseenter focusin",function(){
        $(this).siblings("").removeClass("act");
        $(this).siblings("").find(".actW").removeClass("act");
        $(this).addClass("act");
    });
    $(".actW").on("mouseleave",function(){
        $(this).removeClass("act");
    });
})

//외부영역 클릭시 이벤트
function documentClick(obj,Class){
    $(document).mouseup(function (e){
        if(!Class){
            var Class = "on";
        };
        $(obj).each(function () {
            if($(this).has(e.target).length === 0){
                $(this).removeClass(Class);
            }
        });
    });
}
//스크롤 외부 영역 고정
function mouseWheel(){
    $.fn.extend({
        mouse_wheel: function() {
            $(this).on('mousewheel', function(e) {
                if (e.originalEvent.wheelDelta >= 120) {
                    this.scrollTop -= 50;
                } else if (e.originalEvent.wheelDelta <= -120) {
                    this.scrollTop += 50;
                }
                return false;
            });
        }
    });
    $('.js_mouseWheel').mouse_wheel();
}

//애니메이션
function aosInit(){
    AOS.init({
        // Global settings:
        disable: false, // accepts following values: 'phone', 'tablet', 'mobile', boolean, expression or function
        startEvent: 'DOMContentLoaded', // name of the event dispatched on the document, that AOS should initialize on
        initClassName: 'aos-init', // class applied after initialization
        animatedClassName: 'aos-animate', // class applied on animation
        useClassNames: false, // if true, will add content of `data-aos` as classes on scroll
        disableMutationObserver: false, // disables automatic mutations' detections (advanced)
        debounceDelay: 50, // the delay on debounce used while resizing window (advanced)
        throttleDelay: 99, // the delay on throttle used while scrolling the page (advanced)

        // Settings that can be overridden on per-element basis, by `data-aos-*` attributes:
        offset: 150, // offset (in px) from the original trigger point
        delay: 0, // values from 0 to 3000, with step 50ms
        duration: 1000, // values from 0 to 3000, with step 50ms
        easing: 'ease', // default easing for AOS animations
        once: false, // whether animation should happen only once - while scrolling down
        mirror: false, // whether elements should animate out while scrolling past them
        anchorPlacement: 'top-bottom', // defines which position of the element regarding to window should trigger the animation
    });
}
//faq 게시판
function boardFaq(BSbtn){
    var BStit = BSbtn.parents(".BStit");
    var BScon = BStit.next(".BScon");
    if(BScon.css("display")=="none"){
        BScon.slideDown(100).addClass("open").siblings(".BScon").hide().removeClass("open");
        BStit.addClass("on").siblings(".BStit").removeClass("on");
    }else{
        BScon.hide().removeClass("open");
        BStit.removeClass("on");
    }
};
$(document).ready(function () {
    // 스크롤 위치 계산 함수
    function calculateScrollPosition() {
        const $dp2LiOn = $('#contents .sub_page_menu .gnb .dp2 > li.on');
        if ($dp2LiOn.length) {
            const containerScrollLeft = $('#contents .sub_page_menu .gnb .dp2').scrollLeft();
            const dp2LiOnOffsetLeft = $dp2LiOn.offset().left;
            const dp2ContainerOffsetLeft = $('#contents .sub_page_menu .gnb .dp2').offset().left;
            const scrollLeft = dp2LiOnOffsetLeft - dp2ContainerOffsetLeft + containerScrollLeft;
            return scrollLeft;
        }
        return 0; // li.on 요소가 없으면 스크롤 위치를 0으로 설정
    }

    // li.on 요소 위치로 스크롤 이동
    $('#contents .sub_page_menu .gnb .dp2').scrollLeft(calculateScrollPosition());
});
