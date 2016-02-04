class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  def show
  end

  def edit
  end

  def update
    binding.pry
    @profile.update_attributes(profile_params)
    respond_with(@profile)
  end

  private
    def set_profile
      @profile = Profile.friendly.find(params[:id])
    end

    def profile_params
      params.require(:profile).permit(pictures_attributes: :avatar)
    end
end
