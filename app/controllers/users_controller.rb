class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to(@user, :notice => 'Usuário foi criado com sucesso.') }
        format.xml { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(user_params)
        format.html { redirect_to(@user, notice: 'Usuário foi atualizado com sucesso.') }
        format.xml { render xml: @user, status: :updated, location: @user }
      else
        format.html { render action: "edit" }
        format.xml { render xml: @user.errors, status: unprocessable_entity }
      end
    end
  end

  def show
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
end
