module TvRage
  module Shows
    class ListItem
      def initialize(raw_show)
        @raw_show = raw_show
      end

      def id
        raw_show['id'].to_i
      end

      def to_hash
        {
          tv_rage_id: id,
          name: raw_show['name'],
          status: raw_show['status']
        }
      end


      private

      attr_reader :raw_show
    end
  end
end
