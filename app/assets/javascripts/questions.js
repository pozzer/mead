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
    pub.search =  function() {
      $("#birds").keyup(function(){
        console.log("up");
        jQuery.ajax({
            type: "GET",
            contentType: "application/json",
            dataType:"json",
            url: "https://gerda.herokuapp.com/api/questions",
            data: {valor: $(this).val()},
            beforeSend: function (xhr) {
              xhr.setRequestHeader("Authorization", "Token token=token")
            },
            success: function(data) {
                if (data != null){
                    pub.mount_question(data.questions);
                    pub.autocomplete(data.sugestoes)
                }

            },
            error: function(data) {
                console.log("erro")
            }
        });
      });
    }

    pub.complet = function(text) {
        var texto = $("#birds").val() + " " + text;
        console.log(texto)
        return texto
    }

    pub.autocomplete = function(sugestoes) {
        console.log(sugestoes);

        $('#birds').autocomplete({
            source:[sugestoes.map(pub.complet)]
        });
    }


    pub.mount_question = function (questions){
        $("#question_list div").remove();
        $(questions).each(function() {
            $("#question_list").append('<div><a class="block block-content-full bg-flat block-link-hover3" href="https://tccmead.herokuapp.com/questions/'+this.id+'"><div class="block-content block-content-full  clearfix"><span class="text-white tab">'+this.title+'</span></div></a></div>');
        });
    }

    pub.init = function() {
      pub.autocomplete();
      pub.search();
      $(".edit-answer").click(priv.toggleAnswerEdit);
    }
    return pub;
  }()
};
mead_project.questions.index = mead_project.questions.search = mead_project.questions.update =
    mead_project.questions.create = mead_project.questions.new = mead_project.questions.edit = mead_project.questions.show =  mead_project.questions.common;

