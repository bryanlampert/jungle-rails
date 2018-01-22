require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations:" do

    # Uncomment below to use shoulda matchers validations
    # it { is_expected.to validate_presence_of(:first_name) }
    # it { is_expected.to validate_presence_of(:last_name) }
    # it { is_expected.to validate_presence_of(:email) }
    # it { is_expected.to validate_presence_of(:password) }

    before :each do
      @user1 = FactoryGirl.build(:user)
      @user2 = FactoryGirl.build(:user)
    end

    it 'Should save to db if all fields are present' do
      @user1.save
      expect(@user1.id).to be_present
    end

    it 'Should have an empty first name if first name is blank' do
      @user1.first_name = nil
      @user1.save
      expect(@user1.first_name).to be(nil)
    end

    it 'Should have an empty last name if last name is blank' do
      @user1.last_name = nil
      @user1.save
      expect(@user1.last_name).to be(nil)
    end

    it 'Should have an empty email if there is no email' do
      @user1.email = nil
      @user1.save
      expect(@user1.email).to be(nil)
    end

    it 'Should have an empty password if there is no password' do
      @user1.password = nil
      @user1.save
      expect(@user1.password).to_not be(nil)
    end

    it 'Should have an empty password confirmation if there is no password confirmation' do
      @user = FactoryGirl.build(:user, password_confirmation: nil)
      @user.save
      expect(@user.id).to be(nil)
    end

    it 'Should give an error when password does not match password_confirmation' do
      @user1.password_confirmation = 'thisshouldbepassword'
      @user1.save
      expect(@user1.errors.full_messages).to include('Password confirmation doesn\'t match Password')
    end

    it'Should give an error if password is less than six characters' do
      @user1.password = 'ab12'
      @user1.save
      expect(@user1.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'Should give an error if the email is already in use' do
      @user2.email = @user1.email
      @user1.save
      @user2.save
      expect(@user2.errors.full_messages).to include('Email has already been taken')
    end

    it 'Should give an error if the email is in use and written in different case' do
      @user2.email = @user1.email.upcase!
      @user1.save
      @user2.save
      expect(@user2.errors.full_messages).to include('Email has already been taken')
    end

  end

  describe '.authenticate_with_credentials' do
    before :each do
      @user = FactoryGirl.build(:user)
      @user.save!
    end

    it 'Should authenticate as a truthy value' do
      expect(@user.authenticate_with_credentials(@user.email, @user.password)).to be_truthy
    end

    it 'Should authenticate a lowercase email as a truthy value' do
      @user.email = @user.email.downcase
      @user.save!
      expect(@user.authenticate_with_credentials(@user.email, @user.password)).to be_truthy
    end

    it 'Should authenticate a uppercase email as a truthy value' do
      @user.email = @user.email.upcase
      @user.save!
      expect(@user.authenticate_with_credentials(@user.email, @user.password)).to be_truthy
    end

    it 'Should authenticate email as a truthy value if there are leading/ending spaces' do
      @user.email = "  #{@user.email}  "
      @user.save!
      expect(@user.authenticate_with_credentials(@user.email, @user.password)).to be_truthy
    end
  end

end
