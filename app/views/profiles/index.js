$("#profile-content").html('<%= j(render partial: 'searchs/block_profile_search', locals: { profiles: @profiles}) %>');
