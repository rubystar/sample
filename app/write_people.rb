class WritePeople
  def initialize(people, *keys)
    @people = people
    @keys = keys
  end

  def write
    result = []
    people.each do |person|
      str = []
      keys.each do |k|
        str << "#{person[k]}"
      end
      result << str.join(", ")
    end
    result
  end

  private

  attr_reader :people, :keys
end