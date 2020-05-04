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

    def getevents
        user = User.find_by(name: params[:currentUser])

        if user
            render :json => {
                events: user.events
            }
        else
            render json: {error: "Not logged in"}, status: :unauthorized
        end
    end

end