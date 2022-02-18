require 'Date'
class DataParser

  CITY_MAP = {
    "NYC" => "New York City",
    "LA"  => "Los Angeles"
  }

  def initialize(params, separator="", date_format="%Y-%m-%d")
    @params = params
    @separator = separator
    @date_format = date_format
  end

  def parse
    lines = params.split("\n").map { |e| e.split(separator) }
    headers = lines.shift
    final = []

    lines.each do |e|
      ele = {}
      0.upto(headers.length - 1) do |i|
        if headers[i] == "birthdate"
          ele[headers[i]] = Date.strptime(e[i], date_format).strftime("%-m/%-d/%Y")
        elsif headers[i] == "city"
          ele[headers[i]] = CITY_MAP[e[i]] || e[i]
        else
          ele[headers[i]] = e[i]
        end
      end
      final << ele
    end

    return final
  end


  private

  attr_reader :separator, :params, :date_format
end