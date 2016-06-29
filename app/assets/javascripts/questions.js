if (window.mead_project === undefined) window.mead_project = {};

mead_project.questions = {
  common: function() {
    var priv = {};
    var pub = {};

    pub.mount_question = function (questions){
        $("#question_list div").remove();
        $(questions).each(function() {
            $("#question_list").append('<div><a class="block block-content-full bg-flat block-link-hover3" href="https://tccmead.herokuapp.com/questions/'+this.id+'"><div class="block-content block-content-full  clearfix"><span class="text-white tab">'+this.title+'</span></div></a></div>');
        });
    }

    pub.add_tags = function(sugestoes){
      if (sugestoes.length > 0) {
        $("#finder option:not(:selected)").remove();
        $("#finder").select2({ tags: sugestoes, tokenSeparators: [",", " "] });
        $("#finder").select2("open"); 
      }
    }
    pub.init = function() {
        $('#finder').change(function(){
          var val = $(this).val()
          if (val) {            
            $.ajax({
              type: "GET",
              contentType: "application/json",
              dataType:"json",
              url: "https://gerda.herokuapp.com/api/questions",
              data: {valor: val.toString()},
              beforeSend: function (xhr) {
                $("#spinner-search").show();
                xhr.setRequestHeader("Authorization", "Token token=token")
              },
              success: function(data) {
                if (data != null){
                  pub.mount_question(data.questions);
                  pub.add_tags(data.sugestoes);
                }
              },
              complete: function(data){
                $("#spinner-search").hide();
              },
              error: function(data) {}
            });   
          } else {
            $("#question_list div").remove();
          }
        });
        
        $('#finder').select2({
          tags: true,
          placeholder: "Procure por algo",
          tokenSeparators: [",", " "]
        });

        $('#finder').on("select2:open", function (e) { $('*[aria-selected="true"]').hide(); });
    }
    return pub;
  }()
};
mead_project.questions.index = mead_project.questions.show = mead_project.questions.update =
    mead_project.questions.create = mead_project.questions.new = mead_project.questions.edit = mead_project.questions.show =  mead_project.questions.common;


