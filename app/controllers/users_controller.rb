class UsersController < ApplicationController
  
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
end
