class RatingsController < AppController

  def index
    @ratings = Rating.where(user_id: params[:user_id])
    respond_with(@ratings)
  end

  def create
    @rating = Rating.new(rating_params)
    @rating.user = current_user 
    @rating.save
    @rating.add_or_update_evaluation(:commend, 1, @rating.rateable.user)
    if @rating.rateable.class.to_s == "Bottle"
      respond_with(@rating.rateable, :location => user_bottle_path(@rating.rateable.user, @rating.rateable))
    else
      respond_with(@rating.rateable)
    end
  end

  private
    
    def rating_params
      params.require(:rating).permit([:score, :comment, :rateable_type, :rateable_id])
    end
end
