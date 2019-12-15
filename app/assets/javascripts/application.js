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
//= require jquery
//= require jquery_ujs
//= require activestorage
//= require bootstrap-sprockets
//= require_tree .


//this toggles the button on the home page, so the user knows
//how to use the site
$(document).ready(function(){
  $(".popup-content").hide();
  $("#about").click(function(){
    $(".popup-content").toggle("slow");
  });
});

//this keeps the footer at the bottom of the page
$(document).ready(function() {
  var docHeight = $(window).height();
  var footerHeight = $('#footer').height();
  var footerTop = $('#footer').position().top + footerHeight;

  if (footerTop < docHeight)
      $('#footer').css('margin-top', 10+ (docHeight - footerTop) + 'px');
});

//when a user logs in, signs up or logs out then a message is displayed
//this removes that message after a certain time period
$(document).ready(function(){
   setTimeout(function(){
      $("p.notice").hide("slow");
   },1000);
});

//this slowly fades in the discussion topics on the discussion topic page
$(document).ready(function(){
  $(".topicTile").each(function() {
    $(this).animate({
      opacity: 1
    }, 3000);
  });
});
