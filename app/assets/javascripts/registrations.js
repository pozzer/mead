if (window.mead_project === undefined) window.mead_project = {};

mead_project.registrations = {
    common: function() {
        var priv = {};
        var pub = {};

        pub.init = function() {
        	$("#user_profile_attributes_birth_date").mask("99/99/9999")
        }
        return pub;
    }()
};

mead_project.registrations.create = mead_project.registrations.index = mead_project.registrations.new = mead_project.registrations.common;
