if (window.mead_project === undefined) window.mead_project = {};

mead_project.trades = {
  common: function() {
    var priv = {};
    var pub = {};


    pub.init = function() {
    	$(".overflow-y-auto").prop({ scrollTop: $(".overflow-y-auto").prop("scrollHeight") });
    }
    return pub;
  }()
};
mead_project.trades.index = mead_project.trades.show = mead_project.trades.update =
    mead_project.trades.create = mead_project.trades.new = mead_project.trades.edit = mead_project.trades.show =  mead_project.trades.common;

