require 'spec_helper'

#######################################################
# DO NOT CHANGE THIS FILE - WRITE YOUR OWN SPEC FILES #
#######################################################
RSpec.describe 'OrderedPeople Functional Test' do
  describe 'Order multiple arrays of people' do
    let(:list1) do
      [
        {"first_name"=> "John", "last_name"=> "Doe", "city"=> "New York"},
        {"first_name"=> "Valentino", "last_name"=> "Rossi", "city"=> "Tavulia"},
      ]

    end
    let(:list2) do
      [
        {"first_name"=> "Lewis", "last_name"=> "Hamilton", "city"=> "London"},
        {"first_name"=> "Max", "last_name"=> "Verstappen", "city"=> "Holand"},
      ]
    end
    let(:sory_key) {
      "first_name"
    }
    # let(:keys) do
    #   "first_name", "last_name"
    # end
    let(:ordered_people) { OrderedPeople.new(sory_key, list1, list2) }

    it 'returns an array of strings with the given keys' do
      output = ordered_people.order

      # Expected format of each entry: `<first_name>, <city>, <birthdate M/D/YYYY>`
      expect(output).to eq [
         {"city"=>"New York", "first_name"=>"John", "last_name"=>"Doe"},
         {"city"=>"London", "first_name"=>"Lewis", "last_name"=>"Hamilton"},
         {"city"=>"Holand", "first_name"=>"Max", "last_name"=>"Verstappen"},
         {"city"=>"Tavulia", "first_name"=>"Valentino", "last_name"=>"Rossi"}]
    end
  end
end
