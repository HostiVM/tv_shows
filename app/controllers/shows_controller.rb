class ShowsController < ApplicationController
  expose :upcoming_episodes do
    current_user.upcoming_episodes
  end

  def index
  end

  def edit
    current_user.update_attributes user_params

    redirect_to root_path, notice: 'Your shows were updated'
  end


  private

  def user_params
    params[:user].permit(show_ids: [])
  end
end
