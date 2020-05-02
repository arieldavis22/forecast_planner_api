class AuthController < ApplicationController
before_action :authenticated, only: [:autologin]

    def login
        user = User.find_by(name: params[:name])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            render json: user
        else
            render json: { error: "Invalid username or password. Please log in or sign up" }, status: :unauthorized
        end
    end

    def autologin
        render json: @current_user
    end

    def logout
        reset_session
        render json: { message: "Success" }
    end

end