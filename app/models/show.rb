class Show < ActiveRecord::Base
  has_many :upcoming_episodes,
           class_name: Event,
           dependent: :destroy

  has_many :show_user_assignments,
           dependent: :destroy

  has_many :users,
           through: :show_user_assignments

  scope :active, -> do
    where status: ["1", "9", "10"]
  end

  scope :alphabetically, -> do
    order :name
  end

  def self.search(show_name)
    TvRage::Shows::SearchService.new(show_name).call
  end
end
