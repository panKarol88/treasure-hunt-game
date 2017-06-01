class TreasureHuntController < ApplicationController
  def hunt
    response = AskForTreasure.call(hunter_params[:email], hunter_params[:current_location], current_hunter)
    render json: response.result
  end

  private

    def hunter_params
      params.permit(:email, current_location: [])
    end
end
