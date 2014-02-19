module SurfHelper
  require 'open-uri'
  require 'json'

  def get_surf_conditions spot

    surf_conditions = {}
    url = "http://api.spitcast.com/api/spot/forecast/#{spot}/"
    results = JSON.load(open(url).read)
    
      surf_conditions[:date] = results.first['date']
      surf_conditions[:size] = results.first['size_ft'].round(2)
      surf_conditions[:name] = results.first['spot_name']
      surf_conditions[:swell] = results.first['shape_detail']['swell']
      surf_conditions[:tide] = results.first['shape_detail']['tide']
      # surf_conditions[:wind] = results.first['shape_detail']['wind']
      surf_conditions[:hour] = results.first['hour']
      surf_conditions[:shape_full] = results.first['shape_full']

      url = "http://api.spitcast.com/api/county/water-temperature/san-francisco/"
      results2 = JSON.load(open(url).read)

      surf_conditions[:temp] = results2['fahrenheit'].to_i
      surf_conditions[:wetsuit] = results2['wetsuit'].to_s

      url = "http://api.spitcast.com/api/county/wind/san-francisco/"
      results3 = JSON.load(open(url).read)
      surf_conditions[:wind] = results3.first['speed_mph']

    return surf_conditions

  end

  def get_forecast spot

    surf_conditions = {}
    url = "http://api.spitcast.com/api/spot/forecast/#{spot}/"
    results = JSON.load(open(url).read)

    return results.map do |x|
      {"x" => x['gmt']+":00Z", "size" => x['size_ft']}
      #.to_s.gsub("PM", "").gsub("AM","")x
    end
  end


end
   
    