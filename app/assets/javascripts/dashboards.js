if (window.mead_project === undefined) window.mead_project = {};

mead_project.dashboards = {
  common: function() {
    var priv = {};
    var pub = {};


    pub.init = function() {
    }
    return pub;
  }()
};
mead_project.dashboards.index = mead_project.dashboards.show = mead_project.dashboards.update =
    mead_project.dashboards.create = mead_project.dashboards.new = mead_project.dashboards.edit = mead_project.dashboards.show =  mead_project.dashboards.common;

