module TvRage
  module Shows
    class SearchService
      def initialize(name)
        @name = name
      end

      def call
        Show.where Show.arel_table[:name].matches("%#{name}%")
      end


      private

      attr_reader :name
    end
  end
end
