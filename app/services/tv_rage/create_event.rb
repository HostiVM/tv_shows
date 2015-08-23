module TvRage
  class CreateEvent
    def initialize(day, tv_rage_event)
      @day, @tv_rage_event = day, tv_rage_event
    end

    def call
      if multiple_shows_on_this_time?
        shows_for_this_time.each { |show| Event.create! params(show) }
      else
        Event.create! params(shows_for_this_time)
      end
    end


    private

    attr_reader :tv_rage_event, :day

    def params(show)
      {
        show_id: show_id(show),
        release: release
      }
    end

    def show_id(show)
      tv_rage_id = show['sid'].to_i
      show = Show.find_by(tv_rage_id: tv_rage_id)

      show && show.id
    end

    def release
      time = tv_rage_event['attr']

      DateTime.parse day << ' ' << time
    end

    def multiple_shows_on_this_time?
      shows_for_this_time.is_a? Array
    end

    def shows_for_this_time
      tv_rage_event['show']
    end
  end
end
