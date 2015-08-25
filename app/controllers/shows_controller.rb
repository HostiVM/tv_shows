class ShowsController < ApplicationController
  expose :upcoming_episodes do
    current_user.upcoming_episodes
  end

  def index
  end
end
