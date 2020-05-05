#small edit by Laura
class UsersController < ApplicationController

    def index
        users = User.all

        render json: users
    end

    def create
        user = User.create(name: params[:name], password: params[:password])
        if user
            session[:user_id] = user.id
            render json: user
        else
            render json: { error: "Unable to create new user. Please log in or sign up" }, status: :unauthorized
        end
        
    end

    def addfriend 
        user = User.find_by(name: params[:currentUser])
        friend = User.find_by(name: params[:friend])

        friend.frienders << user

        render json: user
    end

    def seefriends
        user = User.find_by(name: params[:currentUser])

        if user
            all_friends = user.friendees.map{ |friend| friend.name }

            render json: all_friends
        end
    end

    def getevents
        user = User.find_by(name: params[:currentUser])

        if user
            sorted_events = user.events.order(:date)
            render :json => {
                events: sorted_events
            }
        else
            render json: {error: "Not logged in"}, status: :unauthorized
        end
    end

end