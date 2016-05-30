if (window.mead_project === undefined) window.mead_project = {};

mead_project.bottles = {
    common: function() {
      var priv = {};
      var pub = {};

      pub.init = function() {
        return pub;
      }

    }()
};
mead_project.bottles.index = mead_project.bottles.update =
    mead_project.bottles.create = mead_project.bottles.new = mead_project.bottles.edit = mead_project.bottles.common;

