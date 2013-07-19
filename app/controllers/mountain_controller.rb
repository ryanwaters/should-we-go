class MountainController < ApplicationController

  def search
    
    url = "http://opensnow.com/api/getLocationData.php?apikey=waters&lids=#{params[:resort_id]}&type=json"
    @results = JSON.load(open(url).read)
    # @wind = @results['location']['current_conditions']['wind_speed']
    @snow_day = @results['location']['forecast']['period'].first['day']['snow'].to_i
    @snow_night = @results['location']['forecast']['period'].first['night']['snow'].to_i
    @temp_day = @results['location']['forecast']['period'].first['day']['temp'].to_i
    @temp_current = @results['location']['current_conditions']['temp'].to_i

    url = "http://api.wunderground.com/api/d49859f991657379/conditions/q/CA/south_lake_tahoe.json"
    @results2 = JSON.load(open(url).read)
    @wind_speed = @results2['current_observation']['wind_mph'].to_i
    @wind_gust = @results2['current_observation']['wind_gust_mph'].to_i

    url = "http://maps.googleapis.com/maps/api/directions/json?origin=San+Francisco,CA&destination=South+Lake+Tahoe,CA&sensor=false"
    @travel = JSON.load(open(url).read)
    @slt = @travel['routes'].first['legs'].first['duration']['text']

    url = "http://maps.googleapis.com/maps/api/directions/json?origin=San+Francisco,CA&destination=Squaw_Valley,CA&sensor=false"
    @travel2 = JSON.load(open(url).read)
    @squaw = @travel2['routes'].first['legs'].first['duration']['text']

    @score = compute_score()
    @rating = score_message(@score)
    #renders views/mountain/search out of the box
  end

  def compute_score
    @total_score = 0

    # examine snow_day
    case
      when @snow_day > 0 && @snow_day < 5
       @total_score += 5
      when @snow_day > 6 && @snow_day < 11
       @total_score += 10
      when @snow_day > 12 && @snow_day < 24
        @total_score += 15
      when @snow_day > 25
        @total_score += 20
    end
    
    case
      when @snow_night > 0 && @snow_night < 5
        @total_score += 5
      when @snow_night > 6 && @snow_night < 11
        @total_score += 10
      when @snow_night > 12 && @snow_night < 24
        @total_score += 15
      when @snow_night > 25
        @total_score += 20
    end

    #examine something else
    if @wind_speed.is_a? Numeric
      case 
        when @wind_speed == 0
          @total_score += 20
        when @wind_speed > 0 && @wind_speed < 10
          @total_score += 15
        when @wind_speed > 15 && @wind_speed < 30
          @total_score += 10
        when @wind_speed > 30
          @total_score += 0
      end 
    end

    case 
      when @wind_gust == 0
        @total_score += 20
      when @wind_gust > 1 && @wind_gust < 20
        @total_score += 15
      when @wind_gust > 21 && @wind_gust < 40
        @total_score += 10
      when @wind_gust > 41 && @wind_gust < 60
        total_summer += 5
      when @wind_gust > 61
        @total_score += 0
    end 

    case 
      when @temp_day > 0 && @temp_day < 20
        @total_score += 20
      when @temp_day > 21 && @temp_day < 40
        @total_score += 15
      when @temp_day > 41 
        @total_score += 10
    end
    return @total_score
    end

def score_message(score)
  rating = score

  case
  when (rating < 51)
    rating = "Do Snow Dance, Cry, Repeat"
  when (rating > 51 && rating < 60)
    rating = "Watch Ski Porn, Pray for Snow"
  when (rating > 61 && rating < 70)
    rating = "Meh, Still Slidin On Snow"
  when (rating > 71 && rating < 80)
    rating = "Better Than Workin"
  when (rating > 81 && rating < 90)
    rating = "TIME TO SHRED"
  when (rating >= 90)
    rating = "Quit Job, GO SKI"
  end

  return rating
end



end
    














