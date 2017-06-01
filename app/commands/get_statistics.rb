class GetStatistics
  prepend SimpleCommand

  def initialize(analytic_params)
    @start_time = analytic_params[:start_time]&.to_datetime
    @end_time = analytic_params[:end_time]&.to_datetime
    @radius = analytic_params[:radius]
    @errors = []
  end

  def call
    response
  end

  private
    attr_reader :start_time, :locaend_timetion, :radius, :errors

    def response
      requests_to_return = []
      requests.each do |r|
        requests_to_return << { email: Hunter.find(r.hunter_id)&.email, current_location: [r.latitude, r.longitude] }
      end
      { status: "ok", requests: requests_to_return }
    end

    def requests
      if @start_time && @end_time
        requests = Request.in_time_between(@start_time, @end_time)
      else
        @errors << "One or both of your datetime values are blank"
      end

      if requests.present? && @radius
        requests = requests.in_radius(Treasure.active.last, @radius)
      end

      #return last position of every hunter
      # requests_to_return = []
      # requests.order(:created_at).group_by{|a| a[:hunter_id]}.each{|a| requests_to_return << a[1].last}

      requests || @errors << "Data you've provided is not anough." && nil
    rescue
      @errors << "Something went wrong."
    end
end
