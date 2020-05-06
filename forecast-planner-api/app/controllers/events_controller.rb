require 'rest-client'
require 'json'
# ENV["WEATHER_API_KEY"]

class EventsController < ApplicationController

  def index
    events = Event.all
  
      render json: events
  end

  def create
    session["init"] = true
    event = Event.create(title: params["title"], 
      details: params["details"], 
      location: params["location"], 
      date: params["date"],
      indoor: params["indoor"],
      precipitation_chance: []
    )

    req = RestClient.get('http://api.weatherbit.io/v2.0/forecast/daily', {params: {'key' => ENV["WEATHER_API_KEY"], 'city' => event.location}})

    req_data = JSON.parse(req)["data"].select do |data|
      data["valid_date"] === event.date
    end

    if req_data.length > 0
      event.precipitation_chance = req_data[0]["pop"]

      user = User.find_by(name:params["currentUser"])
      user.events << event
  
      render :json => {
        event: event,
        request: req_data
      }
    else
      user = User.find_by(name:params["currentUser"])
      user.events << event
  
      render :json => {
        event: event
      }
    end
  end

  def update
    event = Event.all.find_by(id: params[:id].to_str)
    event.update(
      title: params["title"], 
      details: params["details"], 
      location: params["location"], 
      date: params["date"],
      indoor: params["indoor"]
    )
    render json: event
  end

  def destroy
    Event.destroy(params[:id])
    render json: {message: "Event successfully deleted"}
  end


end
