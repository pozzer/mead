if (window.mead_project === undefined) window.mead_project = {};

mead_project.dashboards = {
    common: function() {
      var priv = {};
      var pub = {};

      pub.init = function() {
        return pub;
      }

    }()
};
mead_project.dashboards.index = mead_project.dashboards.common;

