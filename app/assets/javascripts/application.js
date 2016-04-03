// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require turbolinks
//= require_tree .

$(function(){ $(document).foundation(); });

 //Keep track of last scroll
          var lastScroll = 0;
          $(window).scroll(function(event){
              //Sets the current scroll position
              var st = $(this).scrollTop();
              //Determines up-or-down scrolling
              if (st > lastScroll){
//secondaryNav disappears when scrolled down
                $(".footer").css("display","block");
                $(".header").css({"border":"1px solid #F2F2F2"})
                
              } 
              else {
//secondaryNav disappears when scrolled up
               $(".footer").css("display","none");
               $(".header").css({"border":"none"})
              }
              //Updates scroll position
              lastScroll = st;
          });
          
$(document).ready(function(){
  setTimeout(function(){
    $('#flash').remove();
  }, 3000);
 })         