module TvRage
  class ScheduleEvent
    def initialize(full_schedule = Sofa::TVRage::Schedule.full(:us))
      @full_schedule = full_schedule
    end

    def call
      save_future_events
    end

    private

    attr_reader :full_schedule

    def save_future_events
      future_events.each do |event|
        #...
      end
    end

    def future_events
      full_schedule.first.last
    end

  end
end
