class HomeController < ApplicationController

  
#   def get_all_locations
#     @allLocations = {}
#     1.times do |index|
#       url = "http://opensnow.com/api/getLocationData.php?apikey=waters&lids=#{index+1}&type=json"
#       results = JSON.load(open(url).read)
#       location_id = results["location"]['meta']['location_id']
#       location_name= results["location"]['meta']['name']
#       @allLocations[location_id] = location_name
#     end
#   render :home
# end
  


  def home
  
  end

  def search
  end

  def twitter
    #https://stream.twitter.com/1.1/statuses/filter.json
  end

  # def 
  #   url = "http://opensnow.com/api/getLocationData.php?apikey=waters&lids=1&type=json"
  #   results = JSON.load(open(url)).read
  #   wind = @results['location']['meta']


end
