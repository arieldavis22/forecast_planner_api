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

end