class Cart
  attr_reader :data

  def initialize(cart_data)
    @data = cart_data || {}
  end

  def add_item(item_id)
    data[item_id] ||= 0
    data[item_id] += 1
  end 

  def total_count
    data.values.reduce(:+)
  end
end
