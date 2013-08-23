module MountainHelper
  require 'open-uri'
  require 'JSON'

   def get_ski_conditions resort
       
      ski_condition ={}
      url = "http://opensnow.com/api/getLocationData.php?apikey=waters&lids=#{resort}&type=json"
      results = JSON.load(open(url).read)
      

      ski_condition[:snow_day] = results['location']['forecast']['period'].first['day']['snow'].to_i
      ski_condition[:snow_night] = results['location']['forecast']['period'].first['night']['snow'].to_i
      ski_condition[:temp_day] = results['location']['forecast']['period'].first['day']['temp'].to_i
      ski_condition[:temp_current] = results['location']['current_conditions']['temp'].to_i

      url = "http://api.wunderground.com/api/d49859f991657379/conditions/q/CA/south_lake_tahoe.json"
      results2 = JSON.load(open(url).read)
      
      ski_condition[:wind_speed] = results2['current_observation']['wind_mph'].to_i
      ski_condition[:wind_gust] = results2['current_observation']['wind_gust_mph'].to_i

      return ski_condition
  end

  def get_travel_times 

    travel = {}
    url = "http://maps.googleapis.com/maps/api/directions/json?origin=San+Francisco,CA&destination=South+Lake+Tahoe,CA&sensor=false"
    destination = JSON.load(open(url).read)

    travel[:slt] = destination['routes'].first['legs'].first['duration']['text']

    url = "http://maps.googleapis.com/maps/api/directions/json?origin=San+Francisco,CA&destination=Squaw_Valley,CA&sensor=false"
    destination2 = JSON.load(open(url).read)

    travel[:squaw] = destination2['routes'].first['legs'].first['duration']['text']

    return travel

  end
end
     


    

