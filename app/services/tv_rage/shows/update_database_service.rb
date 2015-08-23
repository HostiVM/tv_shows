module TvRage
  module Shows
    class UpdateDatabaseService
      def initialize(tv_rage_api = List.new)
        @tv_rage_api = tv_rage_api
      end

      def call
        save_new_shows if tv_rage_api.new_shows_available?
      end


      private

      attr_reader :tv_rage_api

      def save_new_shows
        tv_rage_shows.each do |tv_rage_show|
          Show.create! tv_rage_show.to_hash unless already_saved?(tv_rage_show.id)
        end
      end

      def saved_shows_ids
        @ids ||= Show.pluck(:tv_rage_id)
      end

      def already_saved?(tv_rage_show_id)
        saved_shows_ids.include? tv_rage_show_id
      end

      def tv_rage_shows
        @shows ||= tv_rage_api.shows
      end
    end
  end
end
