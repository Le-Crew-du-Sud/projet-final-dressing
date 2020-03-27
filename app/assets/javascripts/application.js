// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require js/jquery/jquery-2.2.4.min.js
//= require js/popper.min.js
//= require js/bootstrap.min.js
//= require js/plugins.js
//= require js/classy-nav.min.js
//= require js/active.js
//= require_tree .
//= require owl.carousel



$('.owl-carousel').owlCarousel({
    animateIn: 'fadeIn',
    animateOut: 'fadeOut',
    items:1,
    margin:30,
    stagePadding:10,
    smartSpeed:1,
    dots: true,
    loop: true,
    lazyLoad: true,
    autoHeight: true
});



$('.owl-carousel1').owlCarousel({
    loop:true,
    margin:10,
    nav:true,
    responsive:{
        0:{
            items:1
        },
        600:{
            items:3
        },
        1000:{
            items:5
        }
    }
})
