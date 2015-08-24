class StaticPagesController < ApplicationController
  expose :upcoming_episodes do
    Event.all
  end

  def index
  end
end
