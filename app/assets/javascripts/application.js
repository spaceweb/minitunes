// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(document).ready(function (){
  setTimeout("$('#textareaindex').click()", 500);
  $("#textareaindex").popover({
      placement : 'right', //placement of the popover. also can use top, bottom, left or right
      title : '<strong>Explore your taste!</strong>', //this is the top title bar of the popover. add some basic css
      html: 'true',
      delay: { show: 1000, hide: 1000 }, //needed to show html of course
      content : 'We provide recommendations and help you discover new artists based on what you like.' //this is the content of the html box. add the image here or anything you want really.
  });
  $("#loginModal").modal();
  $("#registerModal").modal();
  $("#user-edit").modal();
});

