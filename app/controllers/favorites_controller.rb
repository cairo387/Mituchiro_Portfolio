class FavoritesController < ApplicationController
  def create
    Favorite.create(user_id: current_user.id, chiropractor_id: params[:chiropractor_id])
    redirect_to chiropractor_chiropractor_path(params[:chiropractor_id])
  end

  def destroy
    Favorite.find_by(user_id: current_user.id, chiropractor_id: params[:chiropractor_id]).destroy
    redirect_to chiropractor_chiropractor_path(params[:chiropractor_id])
  end
end
