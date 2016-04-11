class FriendshipsController < ApplicationController
  def create
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
    @profile = Profile.where(user_id: params[:friend_id]).first
    if @friendship.save
      redirect_to profile_path(@profile), notice: 'Amigo adicionado.'
    else
      redirect_to profile_path(@profile), notice: 'Amigo não pode ser adicionado.'
    end
  end
  
  def destroy
    @friendship = current_user.friendships.where(friend_id: params[:id]).first
    @friendship.destroy
    @profile = Profile.where(user_id: params[:id]).first
    redirect_to profile_path(@profile), notice: 'Amigo removido.'
  end
end