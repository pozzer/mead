if (window.mead_project === undefined) window.mead_project = {};

mead_project.trades = {
    common: function() {
      var priv = {};
      var pub = {};

      pub.init = function() {
        return pub;
      }

    }()
};
mead_project.trades.index = mead_project.trades.update =
    mead_project.trades.create = mead_project.trades.new = mead_project.trades.edit = mead_project.trades.common;

