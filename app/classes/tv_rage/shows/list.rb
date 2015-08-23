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

      def new_shows_available?
        tv_rage_shows.size > Show.all.size
      end


      private

      attr_reader :tv_rage_shows
    end
  end
end
