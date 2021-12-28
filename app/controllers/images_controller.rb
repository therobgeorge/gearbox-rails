class ImagesController < ApplicationController

  before_action :authenticate_user

  def create
    image = Image.new(
      gear_id: params[:gear_id], 
      photo_url: params[:photo_url]
    )
    if image.save
      render json: image
    else
      render json: { errors: image.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    image = Image.find(params[:id])
    image.destroy
    render json: { message: "Image destroyed" }
  end

end
