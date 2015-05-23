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

  def total_cost
    #calc subtotal of each item
    #add subtotal
    data.map do |id, quantity|
      Item.find(id).price * quantity
    end.reduce(:+)
  end
end
