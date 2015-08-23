module TvRage
  module Events
    class FullSchedule
      def initialize(full_schedule = Sofa::TVRage::Schedule.full(:us))
        @full_schedule = full_schedule
      end

      def events_by_days
        raw_events.map { |raw_event| ForDay.new(raw_event) }
      end


      private

      attr_reader :full_schedule

      def raw_events
        full_schedule.first.last
      end
    end
  end
end
