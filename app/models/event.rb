class Event < ActiveRecord::Base
  belongs_to :show

  default_scope do
    order :release
  end

  scope :upcoming, -> do
    where arel_table[:release].gteq(DateTime.now)
  end
end
