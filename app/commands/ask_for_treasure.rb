class AskForTreasure
  prepend SimpleCommand

  def initialize(email, location)
    @email = email
    @location = location
    @errors = []
  end

  def call
    response
  end

  private
    attr_reader :email, :location, :errors

    def response
      distance = get_distance

      if @errors.size > 0
        { status: "ok", distance: "-1", error: "#{errors}" }
      else
        if distance <= 5
          HunterNotifierMailer.send_treasure_found_email(email, [treasure.latitude, treasure.longitude]).deliver
        end
        { status: "ok", distance: distance }
      end
    end

    def get_distance
      Geocoder::Calculations.distance_between([treasure.latitude, treasure.longitude],
        [location[0], location[1]])*1000 if treasure.present?
      rescue
        @errors << "Geocoder was not able to process this entity"
    end

    def treasure
      t = Treasure.where(active: true).last
      t || @errors << "There is no treasure, sorry :(" && nil
    end
end
