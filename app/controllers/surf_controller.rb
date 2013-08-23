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
    @temp = @surf_conditions[:temp]
    @hour = @surf_conditions[:hour]
    @shape_full = @surf_conditions[:shape_full]
    @wind = @surf_conditions[:speed_mph]
    
    @graph = get_forecast params[:spot_id]

  end
end

