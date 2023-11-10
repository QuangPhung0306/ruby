var window_height;
var window_width;
var navbar_initialized = false;
var nav_toggle;

var offCanvas = {
    sidenav: {
        // Sidenav is not visible by default.
        // Change to 1 if necessary
        sidenav_visible: 0
    },
    initSideNav: function initSideNav() {
        if (!navbar_initialized) {
            var $nav = $('nav');

            // Add the offcanvas class to the navbar if it's not initialized
            $nav.addClass('navbar-offcanvas');

            // Clone relevant navbars
            var $navtop = $nav.find('.navbar-top').first().clone(true);
            var $navbar = $nav.find('.navbar-collapse').first().clone(true);

            // Let's start with some empty vars
            var ul_content = '';
            var top_content = '';

            // Set min-height of the new sidebar to the screen height
            $navbar.css('min-height', window.screen.height);

            // Take the content of .navbar-top
            $navtop.each(function () {
                var navtop_content = $(this).html();
                top_content = top_content + navtop_content;
            });

            // Take the content of .navbar-collapse
            $navbar.children('ul').each(function () {
                var nav_content = $(this).html();
                ul_content = ul_content + nav_content;
            });

            // Wrap the new content inside an <ul>
            ul_content = '<ul class="navbar-nav sidebar-nav">' + ul_content + '</ul>';

            // Insert the html content into our cloned content
            $navbar.html(ul_content);
            $navtop.html(top_content);

            // Append the navbar to body,
            // and insert the content of the navicons navbar just below the logo/nav-image
            $('body').append($navbar);
            $('.nav-image').after($navtop);


            // Set the toggle-variable to the Bootstrap navbar-toggler button
            var $toggle = $('.navbar-toggler');

            // Add/remove classes on toggle and set the visiblity of the sidenav,
            // and append the overlay. Also if the user clicks the overlay,
            // the sidebar will close
            $toggle.on('click', function () {
                if (offCanvas.sidenav.sidenav_visible == 1) {
                    $('html').removeClass('nav-open');
                    offCanvas.sidenav.sidenav_visible = 0;
                    $('#overlay').remove();
                    setTimeout(function () {
                        $toggle.removeClass('toggled');
                    }, 300);
                } else {
                    setTimeout(function () {
                        $toggle.addClass('toggled');
                    }, 300);

                    // Add the overlay and make it close the sidenav on click
                    var div = '<div id="overlay"></div>';
                    $(div).appendTo("body").on('click', function () {
                        $('html').removeClass('nav-open');
                        offCanvas.sidenav.sidenav_visible = 0;
                        $('#overlay').remove();
                        setTimeout(function () {
                            $toggle.removeClass('toggled');
                        }, 300);
                    });

                    $('html').addClass('nav-open');
                    offCanvas.sidenav.sidenav_visible = 1;
                }
            });
            // Set navbar to initialized
            navbar_initialized = true;
        }
    }
};

$(document).ready(function () {
    window_width = $(window).width();

    nav_toggle = $('nav').hasClass('navbar-offcanvas') ? true : false;

    // Responsive checks
    if (window_width < 992 || nav_toggle) {
        offCanvas.initSideNav();
    }

    // Close the sidebar if the user clicks a link or a dropdown-item,
    // and close the sidebar
    $('.nav-link:not(.dropdown-toggle), .dropdown-item').on('click', function () {
        var $toggle = $('.navbar-toggler');

        $('html').removeClass('nav-open');
        offCanvas.sidenav.sidenav_visible = 0;
        setTimeout(function () {
            $toggle.removeClass('toggled');
        }, 300);
    });

    $('#owl-carousel121').owlCarousel({
        center: true,
        items: 2,
        nav: true,
        loop: false,
        margin: 10,
        responsive: {
            600: {
                items: 4
            }
        }
    });
});

$(window).resize(function () {
    window_width = $(window).width();

    // More responsive checks if the user resize the browser
    if (window_width < 992) {
        offCanvas.initSideNav();
    }

    if (window_width > 992 && !nav_toggle) {
        $('nav').removeClass('navbar-offcanvas');
        offCanvas.sidenav.sidenav_visible = 1;
        navbar_initialized = false;
    }
});

$(document).ready(function () {
    customScroll();
    modalChangeShow();
    js_pscroll();
    window.onload = fixheightthtable;
    fixheighttdtable();
    $(".calculation_img_w").clone().appendTo(".modal_cal .unit_w");
    $(".calculation_img_w").clone().appendTo(".modal_cal .clt_w");
    $(".calculation_img_w").clone().appendTo(".modal_cal .air_w");
    $('#users').on('click', '.egency_acc_txt', function() {
      $(this).parents('.egency_it').toggleClass("active_acr");
      $(this).parents('.egency_it ').find('.egency_act').slideToggle();
    });
    $(".cal_btnmb").click(function () {
        $(this).parent().toggleClass("active_acr");
        $(this).siblings().slideToggle();
    });
});

var header = $(".calculation_img");
$(window).scroll(function () {
    var scroll = $(window).scrollTop();
    if (scroll >= window.innerHeight) {
        header.addClass("fixed");
    } else {
        header.removeClass("fixed");
    }
});

$(document).ready(function () {
    $('.nav_scrollpy_all a').click(function () {
        $('html, body').animate({
            scrollTop: $(".calculation_tabs").offset().top
        }, 1000)
    });
});
$(function () {
    $('#datetimepicker').datetimepicker({
        timepicker: false,
        format: 'Y/m/d',
        scrollInput: false
    });
    //$.datetimepicker.setLocale('ja');
    $(".table_checkbox").selectableList();
});


; (function () {
    'use strict';
    $(activate);
    function activate() {
        $('.nav-scroll').scrollingTabs({
            bootstrapVersion: 4,
            scrollToTabEdge: false,
            handleDelayedScrollbar: true,
            enableSwiping: true,
            enableRtlSupport: true,
            forceActiveTab: true,
            cssClassLeftArrow: 'fa fa-chevron-left',
            cssClassRightArrow: 'fa fa-chevron-right',
            disableScrollArrowsOnFullyScrolled: true
        });

    }
}());

$(document).ready(function () {
    var count_elements = $('.nav_tabs_ed li').length;
    var df_elements = $(".js-tabs-default");
    df_elements = 1;
    $(".js-tabs-nb").html(count_elements);

    $('.scrtabs-tab-scroll-arrow-right').click(function () {
        $('.nav_tabs_ed .active').parent().next('li').find('a').trigger('click');
        if (df_elements < count_elements) {
            df_elements += 1;
            $(".js-tabs-default").text(df_elements);
        }
    });

    $('.scrtabs-tab-scroll-arrow-left').click(function () {
        $('.nav_tabs_ed .active').parent().prev('li').find('a').trigger('click');
        if (df_elements > 1) {
            df_elements -= 1;
            $(".js-tabs-default").text(df_elements);
        }
    });
    $('.btnNext').click(function () {
        // if (df_elements < count_elements) {
        //     df_elements += 1;
        //     $(".js-tabs-default").text(df_elements);
        // }
        $('.scrtabs-tab-scroll-arrow-right').trigger('click');
    });
    $('.btnPrevious').click(function () {
        // if (df_elements > 1) {
        //     df_elements -= 1;
        //     $(".js-tabs-default").text(df_elements);
        // }
        $('.scrtabs-tab-scroll-arrow-left').trigger('click');
    });
});

$(document).ready(function () {
    $(".dropdown_sl a").click(function () {
        var html = $(this).text();
        $(this).parent().siblings(".btn_ct_sl").html(html).addClass("color_green");
    });
    $(".btn_ct_sl_ed a").click(function () {
        var html1 = $(this).text();
        $(".txt_rcm").html(html1).addClass("color_red");
    });
});

// scroll + height
//js fixed thead table

function getScrollbarWidth() {
    var outer = document.createElement("div");
    outer.style.visibility = "hidden";
    outer.style.width = "100px";
    outer.style.msOverflowStyle = "scrollbar"; // needed for WinJS apps

    document.body.appendChild(outer);

    var widthNoScroll = outer.offsetWidth;
    // force scrollbars
    outer.style.overflow = "scroll";

    // add innerdiv
    var inner = document.createElement("div");
    inner.style.width = "100%";
    outer.appendChild(inner);

    var widthWithScroll = inner.offsetWidth;

    // remove divs
    outer.parentNode.removeChild(outer);

    return widthNoScroll - widthWithScroll;
}

function customScroll() {
    $('.box-tbodytable').on('scroll', function (event) {
        $(this).siblings('.box-theadtable').scrollLeft($(this).scrollLeft());
    });
}

//function change modal
function modalChangeShow() {
    $('.btn-clickconfirm').click(function () {
        $('#modal-confirm')
            .modal('hide')
            .on('hidden.bs.modal', function (e) {
                $('#modal-sussces').modal('show');

                $(this).off('hidden.bs.modal'); // Remove the 'on' event binding
            });
    });
}

/*==================
[js for scrollbar]*/
//function css for scrollbar
function js_pscroll() {
    $('.box-tbodytable').each(function () {
        var ps = new PerfectScrollbar(this);

        $(window).on('resize', function () {
            ps.update();
        })
    });
}

//function set height of tr in table
function fixheighttdtable() {
    // selector tr for table left
    var tblRowsLeft = '.grouptwotablefixedhead .boxtableleft .tableleft .div-tbody .div-tr';

    // selector for table right
    var tblRowsScroll = '.grouptwotablefixedhead .boxtablescroll .tablescroll .div-tbody .div-tr';
    // init arrays tables
    var tblArr = [tblRowsLeft, tblRowsScroll];

    //loop tr of table to get height
    $(tblRowsLeft).each(function () {

        // get index of row of table left
        var index = $(this).index();
        // get height of row corresponding with index of tables tblScroll

        var highLeft = $(this).height();
        var highMidd = $(tblRowsScroll).eq(index).height();

        // get max height
        var maxHeight = getMaxHeight(highLeft, highMidd);

        // set height for rows on tables tblLeft, tblScroll
        $(tblRowsLeft).eq(index).height(maxHeight);
        $(tblRowsScroll).eq(index).height(maxHeight);
    });
    $(".grouptwotablefixedhead .boxtableleft .box-theadtable").css("margin-right", 0);
    $(".grouptwotablefixedhead .boxtableleft .box-tbodytable01").css("margin-right", -getScrollbarWidth());

    $('.grouptwotablefixedhead .boxtableleft .box-tbodytable01').on('scroll', function (event) {
        if ($(this).is(':hover')) {
            $(this).parent().parent().find('.boxtablescroll .box-tbodytable').scrollTop($(this).scrollTop());
        }

    });
    $('.grouptwotablefixedhead .boxtablescroll .box-tbodytable').on('scroll', function (event) {
        if ($(this).is(':hover')) {
            $(this).parent().parent().find('.boxtableleft .box-tbodytable01').scrollTop($(this).scrollTop());
        }

    });
}

//function set height of tr in table
function fixheightthtable() {

    // selector tr for table left
    var tblRowsLeft = '.grouptwotablefixedhead .boxtableleft .tableleft .div-thead .div-tr';

    // selector for table right
    var tblRowsScroll = '.grouptwotablefixedhead .boxtablescroll .tablescroll .div-thead .div-tr';
    // init arrays tables
    var tblArr = [tblRowsLeft, tblRowsScroll];

    //loop tr of table to get height
    $(tblRowsLeft).each(function () {

        // get index of row of table left
        var index = $(this).index();

        // get height of row corresponding with index of tables tblScroll
        var highLeft = $(this).height();
        var highMidd = $(tblRowsScroll).eq(index).height();

        // get max height
        var maxHeight = getMaxHeight(highLeft, highMidd);
        console.log(highLeft + ',' + highMidd + ',' + maxHeight);

        // set height for rows on tables tblLeft, ttblScroll
        $(tblRowsLeft).eq(index).height(maxHeight);
        $(tblRowsScroll).eq(index).height(maxHeight);
    });
}


function getHeightRowOf(tbl) {
    return $(tbl).height();
}

//function get value max
function getMaxHeight(h1, h2) {
    return h1 > h2 ? h1 : h2;
}




