class OrderedPeople

  def initialize(order_by, *lists)
    @order_by = order_by
    @lists = lists.flatten
  end

  def order
    lists.sort_by! do |hsh|
      hsh[order_by]
    end
    lists
  end

  private

  attr_reader :order_by, :lists
end