class LineItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :item

  def name
    Item.find(item_id).name
  end

  def description
    Item.find(item_id).description
  end

  def price
    Item.find(item_id).price
  end

end
