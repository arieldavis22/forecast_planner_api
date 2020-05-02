#small edit by Laura
class UsersController < ApplicationController
    def create
        user = User.create(name: params[:name], password: params[:password])
        if user
            session[:user_id] = user.id
            render json: user
        else
            render json: { error: "Unable to create new user. Please log in or sign up" }, status: :unauthorized
        end
    end

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
        user = User.find_by(id: session[:user_id])
        if user
            render json: user
        else
            render json: {error: "not logged in"}
        end
    end

    def logout
        reset_session
        render json: {message: "Success"}
    end
end