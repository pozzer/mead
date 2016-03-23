class ProfilesController < AppController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  def show
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
      params.require(:profile).permit(:last_name, :city_id, :about, :organization_name,
                                      pictures_attributes: [:picture, :picture_type],
                                      address_attributes: [:postal_code, :street, :state, :city, :district, :number, :additional])
    end
end

