require 'rails_helper'

RSpec.feature "User Adds a Product To Cart", type: :feature, js: true do
    # SETUP
    before :all do
      @category = Category.create! name: 'Apparel'

      10.times do |n|
        @category.products.create!(
          name:  Faker::Hipster.sentence(3),
          description: Faker::Hipster.paragraph(4),
          image: open_asset('apparel1.jpg'),
          quantity: 10,
          price: 64.99
        )
      end
    end

    scenario "They see all products" do

      visit root_path
      @p = Product.first
      el = find("#product-card-#{@p.id}")
      el.click_link 'Add'

      expect(page).to have_content('My Cart (1)')

      save_screenshot
    end

  end
