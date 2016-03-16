//= require jquery
//= require chat
//= require jquery.turbolinks
//= require jquery_ujs
//= require turbolinks
//= require_self
//= require private_pub

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
//= require js/plugins/select2/select2.full.min.js
//= require js/plugins/rating/jquery.raty-fa.js
//= require js/plugins/easy-pie-chart/jquery.easypiechart.min.js
//= require js/plugins/chartjs/Chart.min.js
//= require js/plugins/masked-inputs/jquery.maskedinput.min.js


//= require_tree .

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

$(function() {
  $('.js-rating').raty({
    size       : 'fa-3x',
    score      : 3,
    target     : '#hint',
    targetType : 'number',
    targetKeep : true

  });
});

$(document).on('page:change', function(event) {
  $('li.open').removeClass("open");
  var active = $('a.active');
  active.parents("li").addClass("open");
});

