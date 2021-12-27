class GearsController < ApplicationController

  before_action :authenticate_user

  def index

    
  end

  def create
    gear = Gear.new(
      user_id: current_user.id,
      category: params[:category],
      make: params[:make],
      model: params[:model],
      color: params[:color],
      serial_number: params[:serial_number],
      other_info: params[:other_info],
      missing: false,
      registered: params[:registered]
    )
    if gear.save
      render json: gear
    else
      render json: {errors: gear.errors.full_messages}, status: :unprocessable_entity
    end
    
  end

end
