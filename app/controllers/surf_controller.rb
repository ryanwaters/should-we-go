class SurfController < ApplicationController
    include SurfHelper


def search
  @surf_conditions = get_surf_conditions params[:spot_id]

  @name = @surf_conditions[:name]
  @date = @surf_conditions[:date]
  @size = @surf_conditions[:size]
  @tide = @surf_conditions[:tide]
  @swell = @surf_conditions[:swell]
  @wind = @surf_conditions[:wind]
  @temp = @surf_conditions[:temp].to_i
  

  @score = compute_score
  @rating = score_message(@score)

end

private
def compute_score
    @total_score = 0
    
  if @surf_conditions[:size].is_a? Numeric
    case
      when @surf_conditions[:size] > 0 && @surf_conditions[:size] < 5
        @total_score += 5
      when @surf_conditions[:size] > 6 && @surf_conditions[:size] < 11
        @total_score += 10
      when @surf_conditions[:size] > 12 && @surf_conditions[:size] < 24
        @total_score += 15
      when @surf_conditions[:size] > 25
        @total_score += 20
    end
  end  

    if @surf_conditions[:swell].is_a? Numeric
      case 
        when @surf_conditions[:swell] == 0
          @total_score += 20
        when @surf_conditions[:swell] > 0 && @surf_conditions[:swell] < 10
          @total_score += 15
        when @surf_conditions[:swell] > 15 && @surf_conditions[:swell] < 30
          @total_score += 10
        when @surf_conditions[:swell] > 30
          @total_score += 0
      end 
    end

  if @surf_conditions[:tide].is_a? Numeric
    case 
      when @surf_conditions[:tide] == 0
        @total_score += 20
      when @surf_conditions[:tide] > 1 && @surf_conditions[:tide] < 20
        @total_score += 15
      when @surf_conditions[:tide] > 21 && @surf_conditions[:tide] < 40
        @total_score += 10
      when @surf_conditions[:tide] > 41 && @surf_conditions[:tide] < 60
        total_summer += 5
      when @surf_conditions[:tide] > 61
        @total_score += 0
    end 
  end

  if @surf_conditions[:wind].is_a? Numeric
    case 
      when @surf_conditions[:wind] > 0 && @surf_conditions[:wind] < 20
        @total_score += 20
      when @surf_conditions[:wind] > 21 && @surf_conditions[:wind] < 40
        @total_score += 15
      when @surf_conditions[:wind] > 41 
        @total_score += 10
    end
  end

  if @surf_conditions[:temp].is_a? Numeric
    case 
      when @surf_conditions[:temp] > 0 && @surf_conditions[:temp] < 20
        @total_score += 20
      when @surf_conditions[:temp] > 21 && @surf_conditions[:temp] < 40
        @total_score += 15
      when @surf_conditions[:temp] > 41 
        @total_score += 10
    end
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