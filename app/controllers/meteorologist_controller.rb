require 'open-uri'

class MeteorologistController < ApplicationController
  def street_to_weather
    @street_address = params.fetch("user_street_address")
    sanitized_street_address = URI.encode(@street_address)

    # ==========================================================================
    # Your code goes below.
    # The street address the user input is in the string @street_address.
    # A sanitized version of the street address, with spaces and other illegal
    #   characters removed, is in the string sanitized_street_address.
    
   key="&key=AIzaSyA5qwIlcKjijP_Ptmv46mk4cCjuWhSzS78"
    url = "https://maps.googleapis.com/maps/api/geocode/json?address="+sanitized_street_address+key
    parsed_data = JSON.parse(open(url).read)
    @latitude = parsed_data.dig("results", 0, "geometry", "location", "lat")
    @longitude = parsed_data.dig("results", 0, "geometry", "location", "lng")
    
    key_ds="b0f8950c11177dd7c358ae9b482dfaff/"
    lat=@latitude
    lng=@longitude
   
    #url_two="https://api.darksky.net/forecast/"+key_ds+lat+
    #parsed_results = JSON.parse(open(url_two).read)
    # ==========================================================================
    @current_temperature =lat

    #@current_summary = url_two

    #@current_temperature =parsed_results.dig("currently", "temperature")

    #@current_summary = parsed_results.dig("currently", "summary")

    #@summary_of_next_sixty_minutes = parsed_results.dig("minutely", "summary")

    #@summary_of_next_several_hours = parsed_results.dig("hourly", "summary")

    #@summary_of_next_several_days = parsed_results.dig("daily", "summary")

    render("meteorologist_templates/street_to_weather.html.erb")
  end

  def street_to_weather_form
    render("meteorologist_templates/street_to_weather_form.html.erb")
  end
end
