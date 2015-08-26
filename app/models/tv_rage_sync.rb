class TvRageSync < ActiveRecord::Base
  scope :shows, -> do
    where data_type: :show
  end

  scope :events, -> do
    where data_type: :event
  end

  default_scope do
    order :created_at
  end
end
