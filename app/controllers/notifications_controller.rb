class NotificationsController < ApplicationController
  before_filter :authenticate_user!
  def index
    @activities = PublicActivity::Activity.order("created_at desc").where(owner_id: current_user.friend_ids, owner_type: "User")
  end

  def read_all
  	current_user.notifications.update_all(read:true)
  	respond_to do |format|
      format.js
    end
  end
end
