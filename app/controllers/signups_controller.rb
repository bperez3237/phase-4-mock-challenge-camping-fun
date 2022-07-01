class SignupsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def create
        signup = Signup.create!(time: params[:time], camper_id: params[:camper_id], activity_id: params[:activity_id])
        activity = Activity.find(params[:activity_id])
        render json: activity, status: :created
    end

    private 

    def render_unprocessable_entity_response(invalid)
        render json: { errors: ["validation errors"] }, status: :unprocessable_entity
    end
end



