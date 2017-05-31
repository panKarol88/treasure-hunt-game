class TreasureHuntController < ApplicationController
  def hunt
    response = AskForTreasure.call(hunter_params[:email], hunter_params[:current_location])
    render json: response.result
  end

  private

    def hunter_params
      params.permit(:email, current_location: [])
    end
end
