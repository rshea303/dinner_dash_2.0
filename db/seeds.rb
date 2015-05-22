class Seed
  def run
    generate_categories
    generate_items
  end

  def generate_categories
    puts "=================="
    puts "seeding categories"
    puts "=================="
    
    cats = ['pasta', 'dessert', 'beverages']
    cats.each do |cat| 
      new_cat = Category.create(name: cat) 
      puts "Category Name: #{new_cat}"
    end

    puts "*******************************"
    puts "#{Category.count} categories seeded successfully!"
    puts "*******************************"
    puts ""
  end

  def generate_items
    puts "=================="
    puts "seeding items"
    puts "=================="
    Category.all.each do |category|
      puts "Category: #{category.name}"
      10.times do
        item = category.items.create(
          name:        Faker::Lorem.word,
          description: Faker::Lorem.sentence,
          price:       Faker::Number.number(4)
        )
        puts "Item Name: #{item.name} -- Description: #{item.description} -- Price: #{item.price}"
      end
    end
    puts "#{Item.count} items seeded successfully!"
    puts "*******************************"
    puts ""
  end
end

Seed.new.run
