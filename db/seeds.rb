# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Seeding Data ..."

# Helper functions
def open_asset(file_name)
  File.open(Rails.root.join('db', 'seed_assets', file_name))
end

# Only run on development (local) instances not on production, etc.
# unless Rails.env.development?
#   puts "Development seeds only (for now)!"
#   exit 0
# end
case Rails.env
when "development"
  # Let's do this ...

  ## CATEGORIES

  puts "Finding or Creating Categories ..."

  cat1 = Category.find_or_create_by! name: 'Apparel'
  cat2 = Category.find_or_create_by! name: 'Electronics'
  cat3 = Category.find_or_create_by! name: 'Furniture'

  ## PRODUCTS

  puts "Re-creating Products ..."

  Product.destroy_all

  cat1.products.create!({
    name:  'Men\'s Classy shirt',
    description: Faker::Hipster.paragraph(4),
    image: cl_image_tag("apparel1_hzkkrv.jpg"),
    quantity: 10,
    price: 64.99
  })

  cat1.products.create!({
    name:  'Women\'s Zebra pants',
    description: Faker::Hipster.paragraph(4),
    image: open_asset('apparel2.jpg'),
    quantity: 18,
    price: 124.99
  })

  cat1.products.create!({
    name:  'Hipster Hat',
    description: Faker::Hipster.paragraph(4),
    image: open_asset('apparel3.jpg'),
    quantity: 4,
    price: 34.49
  })

  cat1.products.create!({
    name:  'Hipster Socks',
    description: Faker::Hipster.paragraph(4),
    image: open_asset('apparel4.jpg'),
    quantity: 8,
    price: 25.00
  })

  cat1.products.create!({
    name:  'Russian Spy Shoes',
    description: Faker::Hipster.paragraph(4),
    image: open_asset('apparel5.jpg'),
    quantity: 8,
    price: 1_225.00
  })

  cat1.products.create!({
    name:  'Human Feet Shoes',
    description: Faker::Hipster.paragraph(4),
    image: open_asset('apparel6.jpg'),
    quantity: 82,
    price: 224.50
  })


  cat2.products.create!({
    name:  'Modern Skateboards',
    description: Faker::Hipster.paragraph(4),
    image: open_asset('electronics1.jpg'),
    quantity: 40,
    price: 164.49
  })

  cat2.products.create!({
    name:  'Hotdog Slicer',
    description: Faker::Hipster.paragraph(4),
    image: open_asset('electronics2.jpg'),
    quantity: 3,
    price: 26.00
  })

  cat2.products.create!({
    name:  'World\'s Largest Smartwatch',
    description: Faker::Hipster.paragraph(4),
    image: open_asset('electronics3.jpg'),
    quantity: 32,
    price: 2_026.29
  })

  cat3.products.create!({
    name:  'Optimal Sleeping Bed',
    description: Faker::Hipster.paragraph(4),
    image: open_asset('furniture1.jpg'),
    quantity: 320,
    price: 3_052.00
  })

  cat3.products.create!({
    name:  'Electric Chair',
    description: Faker::Hipster.paragraph(4),
    image: open_asset('furniture2.jpg'),
    quantity: 0,
    price: 987.65
  })

  cat3.products.create!({
    name:  'Red Bookshelf',
    description: Faker::Hipster.paragraph(4),
    image: open_asset('furniture3.jpg'),
    quantity: 23,
    price: 2_483.75
  })

  user1 = User.create!({
    first_name: "Jozy",
    last_name: "Altidore",
    email: "jozy@tfc.ca",
    password: "password"
  })

  user2 = User.create!({
    first_name: "Michael",
    last_name: "Bradley",
    email: "mb4@tfc.ca",
    password: "password"
  })

  user3 = User.create!({
    first_name: "Victor",
    last_name: "Vazquez",
    email: "vv@tfc.ca",
    password: "password"
  })

  user4 = User.create!({
    first_name: "Seba",
    last_name: "Giovinco",
    email: "10@tfc.ca",
    password: "password"
  })

  prod1 = Product.first
  prod2 = Product.last
  prod3 = Product.find_by(id:10)

  Product.all.each do |product|

    rand(0..4).times do
      product.reviews.create!({
        user_id: rand(1..4),
        description: Faker::Hacker.say_something_smart,
        rating: rand(1..5)
      })
    end

    # product.reviews.create!({
    #   user_id: rand(1..4),
    #   description: Faker::Hipster.paragraph,
    #   rating: rand(1..5)
    # })

    # product.reviews.create!({
    #   user_id: rand(1..4),
    #   description: Faker::Company.bs,
    #   rating: rand(1..5)
    # })

  end

  # prod2.reviews.create!({
  #   user_id: 1,
  #   description: "Love it!",
  #   rating: 5
  # })

  # prod2.reviews.create!({
  #   user_id: 2,
  #   description: "Looks great in the living room",
  #   rating: 4
  # })

  # prod1.reviews.create!({
  #   user_id: 1,
  #   description: "Fit was a bit tight..",
  #   rating: 2
  # })

  # prod3.reviews.create!({
  #   user_id: 1,
  #   description: "Can't believe I ever slept on a 'normal' bed for so long!",
  #   rating: 5
  # })

  # prod3.reviews.create!({
  #   user_id: 2,
  #   description: "What is wrong with all of you who use this...",
  #   rating: 1
  # })

  puts "DONE!"

when "production"

  puts "Finding or Creating Categories ..."

  cat1 = Category.find_or_create_by! name: 'Apparel'
  cat2 = Category.find_or_create_by! name: 'Electronics'
  cat3 = Category.find_or_create_by! name: 'Furniture'

  ## PRODUCTS

  puts "Re-creating Products ..."

  Product.destroy_all

  cat1.products.create!({
    name:  'Men\'s Classy shirt',
    description: Faker::Hipster.paragraph(4),
    image: "http://res.cloudinary.com/dggq7pngh/image/upload/v1516656558/apparel1_hzkkrv.jpg",
    quantity: 10,
    price: 64.99
  })

  cat1.products.create!({
    name:  'Women\'s Zebra pants',
    description: Faker::Hipster.paragraph(4),
    image: "http://res.cloudinary.com/dggq7pngh/image/upload/v1516661251/apparel2_nagqo9.jpg",
    quantity: 18,
    price: 124.99
  })

  cat1.products.create!({
    name:  'Hipster Hat',
    description: Faker::Hipster.paragraph(4),
    image: "http://res.cloudinary.com/dggq7pngh/image/upload/v1516661257/apparel3_kbdzyz.jpg",
    quantity: 4,
    price: 34.49
  })

  cat1.products.create!({
    name:  'Hipster Socks',
    description: Faker::Hipster.paragraph(4),
    image: "http://res.cloudinary.com/dggq7pngh/image/upload/v1516661261/apparel4_dhkyhy.jpg",
    quantity: 8,
    price: 25.00
  })

  cat1.products.create!({
    name:  'Russian Spy Shoes',
    description: Faker::Hipster.paragraph(4),
    image: "http://res.cloudinary.com/dggq7pngh/image/upload/v1516661264/apparel5_mymzci.jpg",
    quantity: 8,
    price: 1_225.00
  })

  cat1.products.create!({
    name:  'Human Feet Shoes',
    description: Faker::Hipster.paragraph(4),
    image: "http://res.cloudinary.com/dggq7pngh/image/upload/v1516661269/apparel6_trxccy.jpg",
    quantity: 82,
    price: 224.50
  })


  cat2.products.create!({
    name:  'Modern Skateboards',
    description: Faker::Hipster.paragraph(4),
    image: "http://res.cloudinary.com/dggq7pngh/image/upload/v1516661272/electronics1_hzorw9.jpg",
    quantity: 40,
    price: 164.49
  })

  cat2.products.create!({
    name:  'Hotdog Slicer',
    description: Faker::Hipster.paragraph(4),
    image: "http://res.cloudinary.com/dggq7pngh/image/upload/v1516661275/electronics2_arqxh8.jpg",
    quantity: 3,
    price: 26.00
  })

  cat2.products.create!({
    name:  'World\'s Largest Smartwatch',
    description: Faker::Hipster.paragraph(4),
    image: "http://res.cloudinary.com/dggq7pngh/image/upload/v1516661279/electronics3_g6gymo.jpg",
    quantity: 32,
    price: 2_026.29
  })

  cat3.products.create!({
    name:  'Optimal Sleeping Bed',
    description: Faker::Hipster.paragraph(4),
    image: "http://res.cloudinary.com/dggq7pngh/image/upload/v1516661283/furniture1_ieq6dz.jpg",
    quantity: 320,
    price: 3_052.00
  })

  cat3.products.create!({
    name:  'Electric Chair',
    description: Faker::Hipster.paragraph(4),
    image: "http://res.cloudinary.com/dggq7pngh/image/upload/v1516661286/furniture2_deggps.jpg",
    quantity: 0,
    price: 987.65
  })

  cat3.products.create!({
    name:  'Red Bookshelf',
    description: Faker::Hipster.paragraph(4),
    image: "http://res.cloudinary.com/dggq7pngh/image/upload/v1516661289/furniture3_fnxyod.jpg",
    quantity: 23,
    price: 2_483.75
  })

  user1 = User.create!({
    first_name: "Jozy",
    last_name: "Altidore",
    email: "jozy@tfc.ca",
    password: "password",
    password_confirmation: "password"
  })

  user2 = User.create!({
    first_name: "Michael",
    last_name: "Bradley",
    email: "mb4@tfc.ca",
    password: "password",
    password_confirmation: "password"
  })

  user3 = User.create!({
    first_name: "Victor",
    last_name: "Vazquez",
    email: "vv@tfc.ca",
    password: "password",
    password_confirmation: "password"
  })

  user4 = User.create!({
    first_name: "Seba",
    last_name: "Giovinco",
    email: "10@tfc.ca",
    password: "password",
    password_confirmation: "password"
  })

  prod1 = Product.first
  prod2 = Product.last
  prod3 = Product.find_by(id:10)

  Product.all.each do |product|

    rand(0..3).times do
      product.reviews.create!({
        user_id: rand(1..4),
        description: Faker::Hacker.say_something_smart,
        rating: rand(1..5)
      })
    end

    # product.reviews.create!({
    #   user_id: rand(1..4),
    #   description: Faker::Hipster.paragraph,
    #   rating: rand(1..5)
    # })

    # product.reviews.create!({
    #   user_id: rand(1..4),
    #   description: Faker::Company.bs,
    #   rating: rand(1..5)
    # })

  end


end