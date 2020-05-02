require 'rest-client'
require 'json'

class EventsController < ApplicationController

  def index
    # req = RestClient.get('http://api.weatherbit.io/v2.0/forecast/daily', {params: {'key' => ENV["WEATHER_API_KEY"], 'city' => 'Atlanta,GA'}})
  
    #   render json: req
  end


end
