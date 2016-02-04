if (window.mead_project === undefined) window.mead_project = {};

mead_project.profiles = {
    common: function() {
        var priv = {};
        var pub = {};

        pub.init = function() {

          $("#question_tag_list").select2();
        }
        return pub;
    }()
};
mead_project.profiles.index = mead_project.profiles.search = mead_project.profiles.update =
    mead_project.profiles.create = mead_project.profiles.new = mead_project.profiles.edit = mead_project.profiles.common;

