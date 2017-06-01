class AskForTreasure
  prepend SimpleCommand

  def initialize(hunter_params, current_hunter)
    @email = hunter_params[:email]
    @location = hunter_params[:current_location]
    @hunter = current_hunter
    @errors = []
  end

  def call
    response
  end

  private
    attr_reader :email, :location, :errors

    def response
      requests_count = Request.in_past_an_hour_for(@hunter).count
      if treasure && requests_count >= treasure.requests_limit
        @errors << "There is a limit of #{treasure.requests_limit} requests per hour. Sorry."
      else
        @hunter.requests.create(treasure: treasure, latitude: location[0],
            longitude: location[1])
        distance = get_distance
      end

      if @errors.size > 0
        { status: "error", distance: "-1", error: "#{errors}" }
      else
        if distance <= treasure.required_distance && treasure.hunters.find_by(id: @hunter.id).nil?
          @hunter.treasures << treasure
          HunterNotifierMailer.send_treasure_found_email(email, treasure).deliver_later
        end
        { status: "ok", distance: distance.to_i }
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
