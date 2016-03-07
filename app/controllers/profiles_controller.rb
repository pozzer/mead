class ProfilesController < AppController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  def show
  end

  def edit
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
      params.require(:profile).permit(:first_name, :last_name, :birth_date, :city_id, :about, :organization_name,
                                      pictures_attributes: [:picture, :picture_type])
    end
end
