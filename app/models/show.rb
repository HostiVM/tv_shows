class Show < ActiveRecord::Base
  has_many :upcoming_episodes,
           class_name: Event,
           dependent: :destroy

  def self.search(show_name)
    TvRage::Shows::SearchService.new(show_name).call
  end
end
