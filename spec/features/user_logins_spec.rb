require 'rails_helper'

RSpec.feature "User can log in", type: :feature, js: true do
    # SETUP
    before :all do
      @user = User.create!(
        first_name: 'Test',
        last_name: 'Testersson',
        email: 'abc@123.ca',
        password: 'iamtest',
        password_confirmation: 'iamtest'
      )

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
      click_link 'Login'

      fill_in 'email', with: 'abc@123.ca'
      fill_in 'password', with: 'iamtest'
      click_button 'Submit'

      expect(page).to have_content 'Test Testersson'

      save_screenshot
    end

  end
