if (window.mead_project === undefined) window.mead_project = {};

mead_project.questions = {
  common: function() {
    var priv = {};
    var pub = {};

    pub.init = function() {
      $("#question_tag_list").select2();

      $( "#question_title" ).focus(function() {
        console.log(1);
        $("#help-block-title").show();
      }).focusout(function() {
        console.log(1);
        $("#help-block-title").hide();
      });

      $(".note-editable" ).focus(function() {
        console.log(2);
        $("#help-block-content").show();
      }).focusout(function() {
        console.log(2);
        $("#help-block-content").hide();
      });

      $("#question_tag_list" ).focus(function() {
        console.log(3);
        $("#help-block-tag").show();
      }).focusout(function() {
        console.log(3);
        $("#help-block-tag").hide();
      });


    }
    return pub;
  }()
};
mead_project.questions.index = mead_project.questions.search = mead_project.questions.update =
    mead_project.questions.create = mead_project.questions.new = mead_project.questions.edit = mead_project.questions.common;

