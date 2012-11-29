class HomeController < ApplicationController
  def index
  end
  def create
    Entrance.delete_all

    x = HTTParty.get('http://data.cityofnewyork.us/api/views/drex-xx56/rows.json')
    y = JSON(x.body)
    count = y["data"].length

    count.times do |a|
      @lat = y["data"][a][9][1]
      @long = y["data"][a][9][1]
      @name = y["data"][a][10]
      @lines = y["data"][a][12]

      @entrance = Entrance.create(:name => @name, :lat => @lat, :long => @long, :line => @lines)
    end

    

    redirect_to entrances_path
  end
  def show
  end
end