require 'rails_helper'

RSpec.feature "Visitor navigates to individual product page", type: :feature, js: true do

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
    click_link @p.name

    expect(page).to have_content @p.quantity

    save_screenshot
  end

end
