require 'Date'

class PeopleController
  def initialize(params)
    @params = params
  end

  def normalize
    percent_restuls =  DataParser.new(params[:percent_format], " % ", "%Y-%m-%d").parse
    dollar_restuls =  DataParser.new(params[:dollar_format], " $ ", "%d-%m-%Y").parse
    ordered_people = OrderedPeople.new("first_name", percent_restuls, dollar_restuls).order

    WritePeople.new(ordered_people, "first_name", "city", "birthdate").write
  end

  private

  attr_reader :params
end
