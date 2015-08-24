module TvRage
  module Events
    class ScheduleService
      def initialize(full_schedule = FullSchedule.new)
        @full_schedule = full_schedule
      end

      def call
        Event.transaction do
          Event.destroy_all

          full_schedule.events_by_days.each do |day_events|
            create_events_for_day day_events
          end
        end
      end


      private

      attr_reader :full_schedule

      def create_events_for_day(day_events)
        day_events.events.each do |event|
          CreateEventService.new(day_events.day, event).call if is_valid?(event)
        end
      end

      def is_valid?(event)
        event.is_a? Hash
      end
    end
  end
end
