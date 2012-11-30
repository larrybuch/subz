class HomeController < ApplicationController
  def index
    @entrances = Entrance.all
  end

  def create
    if Subway.blank?
      x = HTTParty.get('http://data.cityofnewyork.us/api/views/drex-xx56/rows.json')
      y = JSON(x.body)
      count = y["data"].length

      count.times do |a|
        lat = y["data"][a][9][1]
        long = y["data"][a][9][2]
        name = y["data"][a][10]
        lines = y["data"][a][12]
        @entrance = Entrance.create(:name => name, :lat => lat, :long => long, :line => lines)
      end
    end
    redirect_to entrances_path
  end

  def show
    @entrances = Entrance.all
  end

  def search
    query = params[:query]
    if query.present?
      @entrances = Entrance.text_search(query)
    else
      @entrances.all
    end
  end

end