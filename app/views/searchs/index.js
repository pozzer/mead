$("#profile-content").html('<%= j(render partial: 'block_profile_search', locals: { profiles: @profiles}) %>');
$("#question-content").html('<%= j(render partial: 'block_question_search', locals: { questions: @questions}) %>');
$("#bottle-content").html('<%= j(render partial: 'block_bottle_search', locals: { bottles: @bottles}) %>');
$('html, body').animate({ scrollTop: $('#tabs-container').offset().top }, 'slow');
