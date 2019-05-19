new WOW().init();
wow = new WOW({
    boxClass: 'wow', // default
    animateClass: 'animated', // default
    offset: 0, // default
    mobile: true, // default
    live: true // default
})
wow.init();

// Slider

/* ---------------------------------------------
     Loader Screen
    --------------------------------------------- */
$(window).load(function() {
    $("body").css('overflow-y', 'auto');
    $('#loading').fadeOut(1500);

    var owl = $(".bin-slider");
    owl.owlCarousel({
        navigation: true,
        slideSpeed: 200,
        responsive: true,
        autoPlay: 4000,
        items: 3,
        mouseDrag: true,
        pagination: true,
        itemsCustom: [
            [0, 1],
            [450, 1],
            [600, 2],
            [700, 2],
            [800, 2],
            [1000, 3],
            [1200, 3],
            [1400, 3],
            [1600, 3]
        ],
        navigationText: ["<span class='slider-left'><i class='fa fa-angle-left'></i></span>", "<span class='slider-right'><i class='fa fa-angle-right'></i></span>"],
        stopOnHover: true,
        afterAction: function(el) {
            //remove class active
            this
                .$owlItems
                .removeClass('active');

            //add class active
            this
                .$owlItems //owl internal $ object containing items
                .eq(this.currentItem + 1)
                .addClass('active');
        }
    });

});


$(document).ready(function() {

    $(".home-slider").owlCarousel({
        autoplay: true,
        stopOnHover: true,
        nav: false,
        paginationSpeed: 1000,
        goToFirstSpeed: 2000,
        singleItem: true,
        autoHeight: false,
        transitionStyle: "fadeUp",
        loop: true,
        navText: ["<i class='fa fa-angle-double-left'></i>", "<i class='fa fa-angle-double-right'></i>"],
        //        rtl: true,
        items: 1,
        animateOut: 'fadeOut',
        animateIn: 'fadeIn',
        pagination: false
    });

});


// Single


$(document).ready(function() {

    $(".single-slider").owlCarousel({
        autoplay: true,
        stopOnHover: true,
        nav: false,
        paginationSpeed: 1000,
        goToFirstSpeed: 2000,
        singleItem: true,
        autoHeight: false,
        transitionStyle: "fadeUp",
        loop: true,
        navText: ["<i class='fa fa-angle-left'></i>", "<i class='fa fa-angle-right'></i>"],
        rtl: true,
        items: 1,
        animateOut: 'fadeOut',
        animateIn: 'fadeIn',
        dots: false,
    });

});

// Services
$(document).ready(function() {
    var owl = $(".services");
    owl.owlCarousel({
        autopaly: true,
        autoplayTimeout: 6500,
        smartSpeed: 2000,
        dragEndSpeed: 2000,
        items: 6,
        rtl: true,
        loop: true,
        center: true,
        nav: false,
        pagination: false,
        responsiveClass: true,
        responsive: {
            0: {
                items: 1,
            },
            600: {
                items: 3,
                nav: false
            },
            1000: {
                items: 5,
            }
        }
    });
});

// Clients
$(document).ready(function() {
    var owl = $(".clients");
    owl.owlCarousel({
        rowCustom: 2,
        loop: true,
        nav: true,
        pagination: false,
        autoPaly: false,
        navText: ["<i class='fa fa-angle-left'></i>", "<i class='fa fa-angle-right'></i>"],
        items: 5,
        responsiveClass: true,
        responsive: {
            0: {
                items: 1,
            },
            450: {
                items: 2,
            },
            600: {
                items: 3,
                nav: false
            },
            1000: {
                items: 5,
            }
        }
    });
});


$(function() {
    $('.nextSection').on('click', function(e) {
        e.preventDefault();
        $('html, body').animate({
            scrollTop: $($(this).attr('href')).offset().top + 50
        }, 500, 'linear');
    });
});
//Drop
$('.menu-item-has-children').hover(function() {
    $(this).children('.sub-menu').stop(true, true).delay(100).fadeIn(200);
}, function() {
    $(this).children('.sub-menu').stop(true, true).delay(100).fadeOut(200);
});


// SideBar
$(document).ready(function() {
    var trigger = $('.hamburger'),
        overlay = $('.overlay'),
        isClosed = false;

    trigger.click(function() {
        hamburger_cross();
    });
    overlay.click(function() {
        hamburger_cross();
    });


    function hamburger_cross() {

        if (isClosed == true) {
            overlay.hide();
            trigger.removeClass('is-open');
            trigger.removeClass('opacity');
            overlay.removeClass('is-open');
            overlay.addClass('is-closed');
            isClosed = false;
        } else {
            overlay.show();
            trigger.removeClass('is-closed');
            trigger.addClass('opacity');
            overlay.removeClass('is-closed');
            overlay.addClass('is-open');
            isClosed = true;
        }
    }

    $('[data-toggle="offcanvas"]').click(function() {
        $('#wrapper').toggleClass('toggled');
    });
});



//Nav
$(window).on("scroll", function() {
    if ($(window).scrollTop() > 50) {
        $("nav.moved").addClass("active");
    } else {
        //remove the background property so it comes transparent again (defined in your css)
        $("nav.moved").removeClass("active");
    }
});

// Top

$("a.top").click(function() {
    $("html,body").animate({
        scrollTop: 0
    }, 500);
    return false;
});
var $toTop = $('#top');
$(window).scroll(function() {
    if ($(this).scrollTop() > 400) {
        $toTop.fadeIn();
    } else if ($toTop.is(':visible')) {
        $toTop.fadeOut();
    }
});

// Search
$(".search").click(function(e) {
    $("#search").slideToggle(500);

});

$('.search, #search').on("click", function(e) {
    e.stopPropagation();
});

$('body').click(function() {
    $('#search').slideUp();
});

$(".fancybox").fancybox();