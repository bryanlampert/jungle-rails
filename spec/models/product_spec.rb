require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations:' do

    # Uncomment below for shoulda-matchers validation tests
    # it { is_expected.to validate_presence_of(:name) }
    # it { is_expected.to validate_presence_of(:price) }
    # it { is_expected.to validate_presence_of(:quantity) }
    # it { is_expected.to validate_presence_of(:category) }

    before :each do
      @category = FactoryGirl.build(:category)
      @product = FactoryGirl.build(:product)
    end

    it 'Should save successfully to the db with all fields present' do
      @product.save
      expect(@product.id).to be_present
    end

    it 'Should throw a name can\'t be blank error message with no name' do
      @product.name = nil
      @product.save
      expect(@product.errors.full_messages).to include('Name can\'t be blank')
    end

    it 'Should throw a price can\'t be blank error message with no price' do
      @product.price_cents = nil
      @product.save
      expect(@product.errors.full_messages).to include('Price can\'t be blank')
    end

    it 'Should throw a category can\'t be blank error message with no category' do
      @product.category = nil
      @product.save
      expect(@product.errors.full_messages).to include('Category can\'t be blank')
    end

    it 'Should throw a quantity can\'t be blank error message with no quantity' do
      @product.quantity = nil
      @product.save
      expect(@product.errors.full_messages).to include('Quantity can\'t be blank')
    end

  end

  context "Relationships:" do

    before :each do
      @category = FactoryGirl.build(:category)
      @product = FactoryGirl.build(:product)
    end

    it "Should belong to a category" do
      @product.category = @category
      expect(@product.category).to eq(@category)
    end

  end

end