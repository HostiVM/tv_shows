class Event < ActiveRecord::Base
  extend SimpleCalendar

  has_calendar attribute: :release

  belongs_to :show

  default_scope do
    order :release
  end

  scope :upcoming, -> do
    where arel_table[:release].gteq(DateTime.now)
  end
end
