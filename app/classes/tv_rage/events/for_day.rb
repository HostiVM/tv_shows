module TvRage
  module Events
    class ForDay
      def initialize(raw_day_events)
        @raw_day_events = raw_day_events
      end

      def day
        raw_day_events['attr']
      end

      def events
        raw_day_events['time']
      end


      private

      attr_reader :raw_day_events
    end
  end
end
