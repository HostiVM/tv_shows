module TvRage
  class CreateShow
    def initialize(tv_rage_show)
      @tv_rage_show = tv_rage_show
    end

    def call
      Show.create! params
    end


    private

    attr_reader :tv_rage_show

    def params
      {
        tv_rage_id: tv_rage_show.show_id,
        name: tv_rage_show.name,
        czech_name: czech_name,
        status: tv_rage_show.status.parameterize('_').to_sym,
        ended: tv_rage_show.ended.present?
      }
    end

    def czech_name
      if tv_rage_show.akas.is_a?(Array)
        czech_aka = tv_rage_show.
            akas.
            select { |translation| translation["country"] == "CZ" }

        czech_aka.first["__content__"] unless czech_aka.blank?
      end
    end
  end
end
