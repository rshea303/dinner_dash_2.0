class Order < ActiveRecord::Base
  belongs_to :user

  has_many :line_items
  has_many :items, through: :line_items

  def create_line_items(cart_data)
    cart_data.map do |item_id, quantity|
      LineItem.create(item_id: item_id, quantity: quantity)
    end
  end
end
