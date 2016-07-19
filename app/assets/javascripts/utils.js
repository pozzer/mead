
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

$(function() {
  $('.js-rating').raty({
    size       : 'fa-3x',
    score      : 3,
    target     : '#hint',
    targetType : 'number',
    targetKeep : true

  });
  App.initHelper('summernote')
  //$('[data-provider="summernote"]').each(function(){
  //  $(this).summernote({
  //})
});

$(document).on('page:change', function(event) {
  $('li.open').removeClass("open");
  var active = $('a.active');
  active.parents("li").addClass("open");
});


$(document).ready(function () {
  $("#alert-flash").fadeOut(3000);
});

$(document).ready(function () {
  $(".data").mask("99/99/9999");
  $(".integer").mask('9?99');
  $(".measure").mask("9?999ml");
  $(".measure").mask("9?999ml");
  $(".abv").mask("9?9%");

  $(".js-select2").select2();
  $("span.select2").css("width", "100%");

});
