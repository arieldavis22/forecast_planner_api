class UsersController < ApplicationController
    def create
        user = User.create(name: params[:name], password: params[:password])
        session[:user_id] = user.id

        render json: user
    end

    def login
        user = User.find_by(name: params[:name])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            render json: user
        end

    end
end