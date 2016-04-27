class BottlesController < AppController
  before_action :set_bottle, only: [:show, :edit, :update, :destroy]
  before_action :can_see?, only: [:show, :edit, :update]
  before_action :can_edit?, only: [:edit, :update]
  respond_to :js, only: [:index]
  respond_to :html
  
  def index
    if params[:user_id] == current_user.id.to_s
      @bottles = Bottle.where(user_id: params[:user_id]).page(params[:bottle_page])
    else
      @bottles = Bottle.publics.where(user_id: params[:user_id]).page(params[:bottle_page])
    end
    respond_with(@bottles)
  end

  def new
    @bottle = Bottle.new
  end

  def edit
  end

  def show
  end

  def create
    @bottle = Bottle.new(bottle_params)
    @bottle.user = current_user
    @bottle.save
    respond_with(@bottle, :location => user_bottle_path(@bottle.user, @bottle))
  end

  def update
    @bottle.update_attributes(bottle_params)
    respond_with(@bottle, :location => user_bottle_path(@bottle.user, @bottle))
  end

  def destroy
    @bottle.destroy
    respond_with(@bottle, :location => user_bottles_path(@bottle.user))
  end

  private
    def set_bottle
      @bottle = Bottle.find(params[:id])
    end

    def bottle_params
        params.require(:bottle).permit(:label, :organization_name, :filling_date, :amount, :style, :about, :measure, :abv, :private,
                                      :style_list, :type_list,
                                      pictures_attributes: [:picture, :picture_type])
    end

    def can_see?
      unless @bottle.can_see?(current_user.id)
        redirect_to user_bottles_path(current_user), :flash => { :error => "Garrafa não encontrada." }
      end
    end
    
    def can_edit?
      unless @bottle.can_edit?(current_user.id)
        redirect_to user_bottle_path(@bottle.user, @bottle), :flash => { :error => "Você não pode editar essa Garrafa." }
      end
    end

    
end
