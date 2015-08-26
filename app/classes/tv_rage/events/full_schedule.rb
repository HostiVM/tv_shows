module TvRage
  module Events
    class FullSchedule
      def initialize(full_schedule = Sofa::TVRage::Schedule.full(:us))
        @full_schedule = full_schedule
      end

      def events_by_days
        raw_events.map { |raw_event| ForDay.new(raw_event) }
      end

      def differs_from_database?
        no_events_saved? || summary_hashes_differ?
      end

      def save_sync_info
        TvRageSync.create data_type: 'event', summary_hash: full_schedule.hash
      end


      private

      attr_reader :full_schedule

      def summary_hashes_differ?
        TvRageSync.events.last.summary_hash != full_schedule.hash
      end

      def no_events_saved?
        Event.all.blank?
      end

      def raw_events
        full_schedule.first.last
      end
    end
  end
end
