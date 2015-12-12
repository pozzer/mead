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
//= require turbolinks

// OneUI Core JS: jQuery, Bootstrap, slimScroll, scrollLock, Appear, CountTo, Placeholder, Cookie and App.js
//= require js/core/bootstrap.min
//= require js/core/jquery.slimscroll.min
//= require js/core/jquery.scrollLock.min
//= require js/core/jquery.appear.min
//= require js/core/jquery.countTo.min
//= require js/core/jquery.placeholder.min
//= require js/core/js.cookie.min
//= require js/app.js
//= require ckeditor/init
//= require js/plugins/slick/slick.min
//= require js/plugins/chartjs/Chart.min

//= require_tree .


function debug(msg) {
  if (window.console) {
    console.info(msg);
  }
}

$(function() {
  mead_project.actual = {};
  mead_project.actual.controller = $('body').attr('data-controller');
  mead_project.actual.action = $('body').attr('data-action');

  try {
      mead_project[mead_project.actual.controller][mead_project.actual.action]['init'].call();
  } catch (e) {
    console.debug(e);
    console.debug(e.stack);
    console.debug("\"mead_project." + mead_project.actual.controller + "." + mead_project.actual.action + ".init()\" not found.");
  }

});

$(document).on("page:load ready", function(){
  debug("sadasd")
});
