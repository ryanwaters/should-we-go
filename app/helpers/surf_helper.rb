module SurfHelper
  require 'open-uri'
  require 'JSON'

  def get_surf_conditions spot

    surf_conditions = {}
    url = "http://api.spitcast.com/api/spot/forecast/#{spot}/"
    results = JSON.load(open(url).read)
    
      surf_conditions[:date] = results.first['date']
      surf_conditions[:size] = results.first['size_ft'].round(2)
      surf_conditions[:name] = results.first['spot_name']
      surf_conditions[:swell] = results.first['shape_detail']['swell']
      surf_conditions[:tide] = results.first['shape_detail']['tide']
      surf_conditions[:wind] = results.first['shape_detail']['wind']

      url = "http://api.spitcast.com/api/county/water-temperature/san-francisco/"
      results2 = JSON.load(open(url).read)

      # surf_conditions[:temp] = results2.first['fahrenheit'].to_i
      # surf_conditions[:wetsuit] = results2.first['wetsuit'].to_s

    return surf_conditions

  end
end
      # This was in the controller ----->
      # @date = @surf.first['date']
      # @size = @surf.first['size_ft']
      # @name = @surf.first['spot_name']
      # @swell = @surf.first['shape_detail']['swell']
      # @tide = @surf.first['shape_detail']['tide']
      # @wind = @surf.first['shape_detail']['wind']

     # Water temperature 
    