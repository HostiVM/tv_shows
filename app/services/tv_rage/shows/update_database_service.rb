module TvRage
  module Shows
    class UpdateDatabaseService
      def initialize(remote_shows_list = List.new)
        @remote_shows_list = remote_shows_list
      end

      def call
        recreate_shows if remote_shows_list.differs_from_database?
      end


      private

      attr_reader :remote_shows_list

      def recreate_shows
        Show.transaction do
          Show.delete_all

          remote_shows_list.shows.each do |tv_rage_show|
            Show.create! tv_rage_show.to_hash
          end

          remote_shows_list.save_sync_info
        end
      end
    end
  end
end
