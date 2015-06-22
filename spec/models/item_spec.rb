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
  
  it "is valid" do
    item = Item.new(name: "new item", description: "new item desc", price: 1000)

    expect(item).to be_valid 
  end

  it "is not valid without name" do
    item = Item.new(name: nil, description: "new item desc", price: 1000)

    expect(item).not_to be_valid
  end

  it "is not valid without description" do
    item = Item.new(name: "new item", description: nil, price: 1000)

    expect(item).not_to be_valid
  end

  it "is not valid without price" do
    item = Item.new(name: "new item", description: "new item description", price: nil)

    expect(item).not_to be_valid
  end

  it "has unique name" do
    item = Item.create(name: "the newest item", description: "desc", price: 1000)
    item2 = Item.new(name: "the newest item", description: "desc", price: 1000)
    expect(item2).not_to be_valid
  end
end
