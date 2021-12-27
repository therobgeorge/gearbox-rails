class UsersController < ApplicationController
  
  before_action :authenticate_user, except: [:create]

  def create
    user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
      phone_number: params[:phone_number]
    )
    if user.save
      render json: { message: "User created!"}, status: :created
    else
      render json: { errors: user.erros.full_messages }, status: :bad_request
    end
  end

  def show
    user = User.find(params[:id])
    if current_user.id == user.id
      render json: user
    else
      render json: { message: "Not logged in with correct user" }
    end
  end

  def update
    user = User.find(params[:id])
    if current_user.id == user.id
      if params[:password] && params[:password_confirmation]
        user.password = params[:password]
        user.password_confirmation = params[:password_confirmation]
      end
      user.name = params[:name] || user.name
      user.email = params[:email] || user.email
      user.phone_number = params[:phone_number] || user.phone_number
      if user.save
        render json: user
      else
        render json: { errors: user.errors.full_messages, status: :unprocessable_entity }
      end
    else
      render json: { message: "Not logged in" }
    end
  end

  def destroy
    user = User.find(params[:id])
    if current_user.id == user.id
      user.destroy
      render json: { message: "User destroyed" }
    else
      render json: { message: "Not logged in"}
    end
    
  end

end
