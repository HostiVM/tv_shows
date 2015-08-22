module TvRage
  class CheckForNewShows
    def initialize(tv_rage_shows = Sofa::TVRage::Show.list)
      @tv_rage_shows = tv_rage_shows
    end

    def call
      save_new_shows if new_shows_on_tv_rage?
    end


    private

    attr_reader :tv_rage_shows

    def new_shows_on_tv_rage?
      tv_rage_shows.size > Show.all.size
    end

    def save_new_shows
      Show.transaction do
        tv_rage_shows.each do |tv_rage_show|
          Show.create! params(tv_rage_show) unless already_saved?(tv_rage_show['id'].to_i)
        end
      end
    end

    def params(tv_rage_show)
      {
        tv_rage_id: tv_rage_show['id'],
        name: tv_rage_show['name']
      }
    end

    def saved_shows_ids
      @ids ||= Show.pluck(:tv_rage_id)
    end

    def already_saved?(tv_rage_show_id)
      saved_shows_ids.include? tv_rage_show_id
    end
  end
end
