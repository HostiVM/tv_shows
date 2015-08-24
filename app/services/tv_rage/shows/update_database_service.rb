module TvRage
  module Shows
    class UpdateDatabaseService
      def initialize(remote_shows_list = List.new)
        @remote_shows_list = remote_shows_list
      end

      def call
        save_new_shows if remote_shows_list.new_shows_available?
      end


      private

      attr_reader :remote_shows_list

      def save_new_shows
        tv_rage_shows.each do |tv_rage_show|
          Show.create! tv_rage_show.to_hash unless already_exists?(tv_rage_show.id)
        end
      end

      def saved_shows_ids
        @ids ||= Show.pluck(:tv_rage_id)
      end

      def already_exists?(tv_rage_show_id)
        saved_shows_ids.include? tv_rage_show_id
      end

      def tv_rage_shows
        @shows ||= remote_shows_list.shows
      end
    end
  end
end
