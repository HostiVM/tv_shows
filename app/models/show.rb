class Show < ActiveRecord::Base
  self.primary_key = 'tv_rage_id'

  has_many :upcoming_episodes,
           class_name: Event

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
