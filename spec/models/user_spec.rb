require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it 'should create valid user' do
      user = User.create(
        first_name: "Ben",
        last_name: "Cao",
        email: "ben@ben.com",
        password: "meow",
        password_confirmation: "meow"
      )
      expect(user).to (be_valid)
    end
    
    it 'should have password' do
      user = User.create(
        first_name: "Ben",
        last_name: "Cao",
        email: "ben@ben.com",
        password: nil,
        password_confirmation: "meow"
      )
      expect(user).to_not (be_valid)
    end

    it 'should have password_confirmation' do
      user = User.create(
        first_name: "Ben",
        last_name: "Cao",
        email: "ben@ben.com",
        password: "meow",
        password_confirmation: nil
      )
      expect(user).to_not (be_valid)
    end
    
    it 'should have mathcing password and password_confirmation' do
      user = User.create(
        first_name: "Ben",
        last_name: "Cao",
        email: "ben@ben.com",
        password: "meow",
        password_confirmation: "meow12"
      )
      expect(user).to_not (be_valid)
    end
    
    it 'should have unique email' do
      user1 = User.create(
        first_name: "Ben",
        last_name: "Cao",
        email: "ben@ben.com",
        password: "meow",
        password_confirmation: "meow"
      )
      user2 = User.create(
        first_name: "Ben",
        last_name: "Cao",
        email: "ben@ben.com",
        password: "meow",
        password_confirmation: "meow"
      )
      expect(user1).to (be_valid)
    end

    it 'should have unique email' do
      user1 = User.create(
        first_name: "Ben",
        last_name: "Cao",
        email: "ben@ben.com",
        password: "meow",
        password_confirmation: "meow"
      )
      user2 = User.create(
        first_name: "Ben",
        last_name: "Cao",
        email: "ben@ben.com",
        password: "meow",
        password_confirmation: "meow"
      )
      expect(user2).to_not (be_valid)
    end
    
    it 'should have email' do
      user = User.create(
        first_name: "Ben",
        last_name: "Cao",
        email: nil,
        password: "meow",
        password_confirmation: "meow"
      )
      expect(user).to_not (be_valid)
    end
    
    it 'should have first_name' do
      user = User.create(
        first_name: nil,
        last_name: "Cao",
        email: "ben@shopify.com",
        password: "meow",
        password_confirmation: "meow"
      )
      expect(user).to_not (be_valid)
    end
    
    it 'should have last_name' do
      user = User.create(
        first_name: "Ben",
        last_name: nil,
        email: "ben@shopify.com",
        password: "meow",
        password_confirmation: "meow"
      )
      expect(user).to_not (be_valid)
    end
    
    it 'should have as least 3 characters in password' do
      user = User.create(
        first_name: "Ben",
        last_name: "Cao",
        email: "ben@shopify.com",
        password: "me",
        password_confirmation: "me"
      )
      expect(user).to_not (be_valid)
    end

    it 'should allow email with spaces before and after the address' do
      user = User.create(
        first_name: "Ben",
        last_name: "Cao",
        email: "  ben@shopify.com ",
        password: "meow",
        password_confirmation: "meow"
      )
      expect(user).to (be_valid)
    end
    
    it 'should allow email with upper case' do
      user = User.create(
        first_name: "Ben",
        last_name: "Cao",
        email: "  Ben@shopify.com ",
        password: "meow",
        password_confirmation: "meow"
      )
      expect(user).to (be_valid)
    end

  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
    it 'should login with correct password' do
      user = User.create(
        first_name: "Ben",
        last_name: "Cao",
        email: "ben@ben.com",
        password: "meow",
        password_confirmation: "meow"
      )
      authenticate = User.authenticate_with_credentials(user.email, user.password)
      expect(authenticate).to eq(user)    #authenticate is == user meaning authenticate_with_credentials is successful
    end
  end
end
