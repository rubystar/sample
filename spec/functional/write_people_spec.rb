require 'spec_helper'

#######################################################
# DO NOT CHANGE THIS FILE - WRITE YOUR OWN SPEC FILES #
#######################################################
RSpec.describe 'WritePeople Functional Test' do
  describe 'Write people with given keys' do
    let(:people) do
      [
        {"first_name"=> "John", "last_name"=> "Doe", "city"=> "New York"},
        {"first_name"=> "Valentino", "last_name"=> "Rossi", "city"=> "Tavulia"},
      ]
    end
    # let(:keys) do
    #   "first_name", "last_name"
    # end
    let(:write_people) { WritePeople.new(people, "first_name", "city") }

    it 'returns an array of strings with the given keys' do
      output = write_people.write

      # Expected format of each entry: `<first_name>, <city>, <birthdate M/D/YYYY>`
      expect(output).to eq [
        "John, New York",
        "Valentino, Tavulia"
      ]
    end
  end
end
