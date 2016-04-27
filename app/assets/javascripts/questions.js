if (window.mead_project === undefined) window.mead_project = {};

mead_project.questions = {
  common: function() {
    var priv = {};
    var pub = {};

    priv.toggleAnswerEdit = function(e){
    	e.preventDefault();
    	var form = $("#"+ $(this).data("id"));
    	form.closest("td").find(".content").toggle("slow");
    	form.slideToggle("slow");
  	}

    pub.init = function() {
      
      $(".edit-answer").click(priv.toggleAnswerEdit);
    }
    return pub;
  }()
};
mead_project.questions.index = mead_project.questions.search = mead_project.questions.update =
    mead_project.questions.create = mead_project.questions.new = mead_project.questions.edit = mead_project.questions.show =  mead_project.questions.common;

