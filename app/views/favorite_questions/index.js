$("#favorite-content").html('<%= j(render partial: 'favorite_questions/block_favorite' ) %>');

$('html, body').animate({ scrollTop: $('#favorite-content').offset().top }, 'slow');
