class MountainController < ApplicationController

  def search
    @allConditions = {}
    url = "http://opensnow.com/api/getLocationData.php?apikey=waters&lids=142&type=json"
    @results = JSON.load(open(url)).read
    wind = @results['location']['current_conditions']['wind_speed']
    snow_day = @results['location']['forecast']['period']['day']['snow']
    snow_night = @results['location']['forecast']['period']['night']['snow']
    @allConditions = :wind, :snow_day, :snow_night
    render :allConditions

  end

end