class DestinationPresenter
  def initialize(zip)
    @zip = zip
  end

  def forecast_10_day
    @forecast = raw_forecast.map do |forecast_day|
      Forecast.new(forecast_day)
    end
  end
  private
    attr_reader :zip

    def raw_forecast
      service.get_forecast[:forecast][:simpleforecast][:forecastday]
    end

    def service
      WeatherService.new(zip)
    end
end

class WeatherService
  attr_reader :zip

  def initialize(zip)
    @zip = zip
  end

  def get_forecast
    JSON.parse(Faraday.get(url).body, symbolize_names: true)
  end

  def url
    "http://api.wunderground.com/api/#{ENV["weather_key"]}/forecast10day/q/#{zip}.json"
  end

end
