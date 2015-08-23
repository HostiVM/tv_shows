module TvRage
  class ScheduleEvents
    def initialize(full_schedule = Sofa::TVRage::Schedule.full(:us))
      @full_schedule = full_schedule
    end

    def call
      Event.transaction do
        Event.destroy_all

        future_events.each { |day_events| create_events_for_day day_events }
      end
    end


    private

    attr_reader :full_schedule

    def create_events_for_day(day_events)
      day = day_events['attr']

      day_events['time'].each do |event|
        CreateEvent.new(day, event).call if is_valid?(event)
      end
    end

    def is_valid?(event)
      event.is_a?(Hash)
    end

    def future_events
      full_schedule.first.last
    end
  end
end
