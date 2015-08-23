class Show < ActiveRecord::Base
  has_many :upcoming_episodes,
           class_name: Event,
           dependent: :destroy
end
