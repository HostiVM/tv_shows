module TvRage
  module Shows
    class List
      def initialize(tv_rage_shows = Sofa::TVRage::Show.list)
        @tv_rage_shows = tv_rage_shows
      end

      def shows
        tv_rage_shows.map do |show|
          ListItem.new(show)
        end
      end

      def differs_from_database?
        no_shows_saved? || summary_hashes_differ?
      end

      def save_sync_info
        TvRageSync.create data_type: 'show', summary_hash: tv_rage_shows.hash
      end


      private

      attr_reader :tv_rage_shows

      def summary_hashes_differ?
        TvRageSync.shows.last.summary_hash != tv_rage_shows.hash
      end

      def no_shows_saved?
        Show.all.blank?
      end
    end
  end
end
