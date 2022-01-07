class GearsController < ApplicationController

  before_action :authenticate_user

  def index
    gear = Gear.where(user_id: current_user.id)
    render json: gear
  end

  def create
    gear = nil
    Gear.transaction do
      gear = Gear.create(
        user_id: current_user.id,
        category: params[:category],
        make: params[:make],
        model: params[:model],
        color: params[:color],
        serial_number: params[:serial_number],
        other_info: params[:other_info],
        missing: false,
        registered: params[:registered],
      )
      response = Cloudinary::Uploader.upload(params[:image_base64], resource_type: :auto)
      cloudinary_url = response["secure_url"]


      gear.images.create(photo_url: cloudinary_url)
    end
    render json: gear
  rescue
    render json: {errors: gear.errors.full_messages}, status: :unprocessable_entity
  end

  def show
    gear = Gear.find(params[:id])
    if current_user.id == gear.user_id
      render json: gear
    else 
      render json: { message: "not logged in as correct user" }
    end
  end

  def update
    gear = Gear.find(params[:id])
    if current_user.id == gear.user_id
      gear.category = params[:category] || gear.category
      gear.make = params[:make] || gear.make
      gear.model = params[:model] || gear.model
      gear.color = params[:color] || gear.color
      gear.serial_number = params[:serial_number] || gear.serial_number
      gear.other_info = params[:other_info] || gear.other_info
      gear.missing = params[:missing] || gear.missing
      gear.registered = params[:registered] || gear.registered
      if gear.save
        render json: gear
      else
        render json: {errors: gear.errors.full_messages}, status: :unprocessable_entity
      end
    else
      render json: { message: "not logged in as correct user" }
    end
  end

  def destroy
    gear = Gear.find(params[:id])
    if current_user.id === gear.user_id
      gear.destroy
      render json: { message: "gear destroyed" }
    else
      render json: { message: "not logged in as correct user" }
    end
  end

end
