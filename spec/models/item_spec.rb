require 'rails_helper'

RSpec.describe Item, type: :model do
  it "belongs to a category" do
    category = Category.create(name: "Pasta")
    category.items.create(name: "spaghetti", description: "spaghetti description", price: 1200)

    expect(category.items.first.name).to eq("spaghetti")
    expect(category.items.first.description).to eq("spaghetti description")
    expect(category.items.first.price).to eq(1200)
  end

  it "can be created" do
    count = Item.count
    Item.create(name: "new item", description: "new item description", price: 1000)

    expect(Item.count).to eq(count + 1)
  end 
end
