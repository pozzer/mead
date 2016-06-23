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
    pub.search =  function () {
      $("#birds").keyup(function(){
        console.log("up");
        $.ajax({
          type: "GET",
          dataType: "jsonp",
          //crossDomain: true,
          url: "https://gerda.herokuapp.com/api/questions",
          data: {valor: $(this).val()},
          //xhrFields: {
          //  withCredentials: true
          //},
          headers: {
            "Access-Control-Allow-Origin": "*",
            "Authorization": "Token token=token"
          }
          //beforeSend: function (xhr) {
          //  xhr.setRequestHeader ("Authorization", "Token token=token");
          //},
        }).done(function(data) {
          console.log(data)
          //console.log(data.sugestoes);
          //mount_question(data.questions);
        });
      });
    }
    //function mount_question(questions){
    //    $("#question_list li").remove();
    //    $(questions).each(function() {
    //    $("#question_list").append('<li><a href="https://nameless-sea-78060.herokuapp.com/questions/'+this.id+'"><span class="tab">'+this.title+'</span></a></li>');
    //    });
    //    }
    pub.init = function() {
      console.log("init");
      pub.search();
      $(".edit-answer").click(priv.toggleAnswerEdit);
    }
    return pub;
  }()
};
mead_project.questions.index = mead_project.questions.search = mead_project.questions.update =
    mead_project.questions.create = mead_project.questions.new = mead_project.questions.edit = mead_project.questions.show =  mead_project.questions.common;

