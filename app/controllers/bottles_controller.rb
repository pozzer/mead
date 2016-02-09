class BottlesController < ApplicationController
  before_action :set_bottle, only: [:show, :edit, :update, :destroy]

  def index
    @bottles = Bottle.where(user_id: params[:user_id])
  end

  def new
    @bottle = Bottle.new
  end

  def edit
  end

  def create
    @bottle = Bottle.create(bottle_params)
    @bottle.user = current_user
    @bottle.save
    respond_with(@bottle, :location => user_bottles_path(current_user))
  end

  def update
    @bottle.update_attributes(bottle_params)
    respond_with(@bottle, :location => user_bottles_path(current_user))
  end

  def destroy
    @bottle.destroy
    respond_to do |format|
      format.html { redirect_to bottles_url, notice: 'Bottle was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_bottle
      @bottle = Bottle.find(params[:id])
    end

    def bottle_params
      params.require(:bottle).permit(:label, :organization_name, :filling_date, :amount, :style, :about, :measure, :abv,
                                      pictures_attributes: [:picture, :picture_type])
    end
end
