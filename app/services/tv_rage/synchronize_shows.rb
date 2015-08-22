module TvRage
  class SynchronizeShows
    def initialize(tv_rage_shows = Sofa::TVRage::Show.list)
      @tv_rage_shows = tv_rage_shows
    end

    def call
      regenerate_saved_shows if sync_needed?
    end


    private

    attr_reader :tv_rage_shows

    def sync_needed?
      tv_rage_shows.size > Show.all.size
    end

    def regenerate_saved_shows
      Show.transaction do
        Show.delete_all

        tv_rage_shows.each { |tv_rage_show| Show.create! params(tv_rage_show)}
      end
    end

    def params(tv_rage_show)
      {
        tv_rage_id: tv_rage_show['id'],
        name: tv_rage_show['name']
      }
    end
  end
end
