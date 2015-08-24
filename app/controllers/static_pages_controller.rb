class StaticPagesController < ApplicationController
  expose :upcoming_episodes do
    Event.upcoming
  end

  def index
  end
end
