class ProfilesController < AppController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]
  before_action :can_edit?, only: [:edit]

  def index
    respond_to do |format|
      format.html { redirect_to profile_path(current_user.profile) }
    end
  end

  def show
    @activities = PublicActivity::Activity.order("created_at desc").where(owner_id: @profile.user.id, owner_type: "User")
  end

  def edit
    @profile.build_address if @profile.address.nil?
  end

  def update
    @profile.update_attributes(profile_params)
    respond_with(@profile)
  end

  private
    def set_profile
      @profile = Profile.friendly.find(params[:id])
    end

    def profile_params
      params.require(:profile).permit(:last_name, :about, :organization_name,
                                      pictures_attributes: [:picture, :picture_type],
                                      address_attributes: [:postal_code, :street, :state_id, :city_id, :district, :number, :additional])
    end

    def can_edit?
      unless @profile.can_edit?(current_user.id)
        redirect_to profile_path(@profile)
      end
    end
end

