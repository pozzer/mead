if (window.mead_project === undefined) window.mead_project = {};

mead_project.sessions = {

    common: function() {
        var priv = {};
        var pub = {};

        pub.init = function() {
          startBubbles();
        }
        return pub;

    }()
};

mead_project.sessions.index = mead_project.sessions.new = mead_project.sessions.common;
