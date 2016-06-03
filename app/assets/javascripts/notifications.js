if (window.mead_project === undefined) window.mead_project = {};

mead_project.notifications = {
  common: function() {
    var priv = {};
    var pub = {};


    pub.init = function() {
    }
    return pub;
  }()
};
mead_project.notifications.index = mead_project.notifications.show = mead_project.notifications.update =
    mead_project.notifications.create = mead_project.notifications.new = mead_project.notifications.edit = mead_project.notifications.show =  mead_project.notifications.common;

