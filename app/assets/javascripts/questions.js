if (window.mead_project === undefined) window.mead_project = {};

mead_project.questions = {
    common: function() {
        var priv = {};
        var pub = {};

        pub.init = function() {
          $("#question_tag_list").select2();
        }
        return pub;
    }()
};
mead_project.questions.index = mead_project.questions.search = mead_project.questions.update =
    mead_project.questions.create = mead_project.questions.new = mead_project.questions.edit = mead_project.questions.common;

