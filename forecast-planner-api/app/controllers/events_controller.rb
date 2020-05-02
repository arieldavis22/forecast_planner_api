require 'rest-client'
require 'json'
# ENV["WEATHER_API_KEY"]

class EventsController < ApplicationController

  def index
    events = Event.all
  
      render json: events
  end

  def create
    event = Event.create(title: params["title"], 
      details: params["details"], 
      location: params["location"], 
      date: params["date"]
    )


    req = RestClient.get('http://api.weatherbit.io/v2.0/forecast/daily', {params: {'key' => ENV["WEATHER_API_KEY"], 'city' => event.location}})

    render :json => {
      event: event,
      request: req
    }
  end


end
