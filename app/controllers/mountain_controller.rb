class MountainController < ApplicationController
    include MountainHelper

  def search
 
    @ski_condition = get_ski_conditions params[:resort_id]
    @slt = get_travel_times[:slt]
    @squaw = get_travel_times[:squaw]

    @score = compute_score
    @rating = score_message(@score)
    #renders views/mountain/search out of the box
  end

private
  def compute_score
    @total_score = 0

    # examine snow_day
    case

      when @ski_condition[:snow_day] > 0 && @ski_condition[:snow_day] < 5
       @total_score += 5
      when @ski_condition[:snow_day] > 6 && @ski_condition[:snow_day] < 11
       @total_score += 10
      when @ski_condition[:snow_day] > 12 && @ski_condition[:snow_day] < 24
        @total_score += 15
      when @ski_condition[:snow_day] > 25
        @total_score += 20
    end
    
    case
      when @ski_condition[:snow_night] > 0 && @ski_condition[:snow_night] < 5
        @total_score += 5
      when @ski_condition[:snow_night] > 6 && @ski_condition[:snow_night] < 11
        @total_score += 10
      when @ski_condition[:snow_night] > 12 && @ski_condition[:snow_night] < 24
        @total_score += 15
      when @ski_condition[:snow_night] > 25
        @total_score += 20
    end

    #examine something else
    if @ski_condition[:wind_speed].is_a? Numeric
      case 
        when @ski_condition[:wind_speed] == 0
          @total_score += 20
        when @ski_condition[:wind_speed] > 0 && @ski_condition[:wind_speed] < 10
          @total_score += 15
        when @ski_condition[:wind_speed] > 15 && @ski_condition[:wind_speed] < 30
          @total_score += 10
        when @ski_condition[:wind_speed] > 30
          @total_score += 0
      end 
    end

    case 
      when @ski_condition[:wind_gust] == 0
        @total_score += 20
      when @ski_condition[:wind_gust] > 1 && @ski_condition[:wind_gust] < 20
        @total_score += 15
      when @ski_condition[:wind_gust] > 21 && @ski_condition[:wind_gust] < 40
        @total_score += 10
      when @ski_condition[:wind_gust] > 41 && @ski_condition[:wind_gust] < 60
        total_summer += 5
      when @ski_condition[:wind_gust] > 61
        @total_score += 0
    end 

    case 
      when @ski_condition[:temp_day] > 0 && @ski_condition[:temp_day] < 20
        @total_score += 20
      when @ski_condition[:temp_day] > 21 && @ski_condition[:temp_day] < 40
        @total_score += 15
      when @ski_condition[:temp_day] > 41 
        @total_score += 10
    end
    return @total_score
    end

def score_message(score)
  rating = score

  case
  when (rating < 51)
    rating = "You've got crabs!, Not snow..."
  when (rating >= 50 && rating < 60)
    rating = "Watch Ski Porn, Pray for Snow"
  when (rating >= 60 && rating < 70)
    rating = "Meh, Still Slidin On Snow"
  when (rating >= 70 && rating < 80)
    rating = "Better Than Workin"
  when (rating >= 80 && rating < 90)
    rating = "TIME TO SHRED"
  when (rating >= 90)
    rating = "Quit Job, GO SKI"
  end

  return rating
end



end
    














