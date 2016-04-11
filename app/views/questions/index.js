$("#newest-content").html('<%= j(render partial: 'questions/block_newest' ) %>');
$("#unanswered-content").html('<%= j(render partial: 'questions/block_unanswered' ) %>');
$("#vote-content").html('<%= j(render partial: 'questions/block_vote' ) %>');


$('html, body').animate({ scrollTop: $('#tabs-container').offset().top }, 'slow');
