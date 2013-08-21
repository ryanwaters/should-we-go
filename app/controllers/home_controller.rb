class HomeController < ApplicationController

  
  def home
  
  @resorts =[
    ["Kirkwood", "142"],
    ["Sugar Bowl", "139"],
    ["Northstar", "138"],
    ["Heavenly", "135"],
    ["Alpine Meadows", "148"],
    ["Sierra at Tahoe", "148"],
    ["Homewood","151"], 
    ["Squaw Valley", "141"]
  ]

  @spots = [
    ["Fort Point", "113"],
    ["Eagles Point", "649"],
    ["Deadmans", "648"],
    ["Kellys Cove", "697"],
    ["North Ocean Beach", "114"],
    ["South Ocean Beach", "117"]
  ]

  end

  def search
  end

  def surf_rating
  end

  def how_to_use
  end

  def about
  end

  def twitter
    #https://stream.twitter.com/1.1/statuses/filter.json
  end


end
