class TreasureHuntController < ApplicationController
  def hunt
    response = AskForTreasure.call(hunter_params, current_hunter)
    render json: response.result
  end

  def analytics
    response = GetStatistics.call(analytic_params)
    render json: response.result
  end

  private

    def hunter_params
      params.permit(:email, current_location: [])
    end

    def analytic_params
      params.permit(:start_time, :end_time, :radius)
    end
end
