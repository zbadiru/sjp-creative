class UserController < ApplicationController
  def sign_in
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      render json: { username: user.username, token: generate_token({ id: user.id }) }
    else
      render json: { message: "Failed to Sign In!"}
    end
  end

  def validate
    id = decode_token
    user = User.find_by(id: id)

    if user  
      render json: { username: user.username, token: generate_token({ id: user.id }) }
    else
      render json: { message: "Failed to Sign In!"}
    end
  end

  def new
  end

  def create
  end
end
