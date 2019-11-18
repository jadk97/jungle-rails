require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it "must be created with an email, name, and matching passwords" do
      @user = User.create(name: "Jane Doe", email: "jane.doe@gmail.com", password: "12345678", password_confirmation: "12345678")
      expect(@user).to be_valid
    end

    it "if passwords and password_confirmation don't match, it shouldn't be valid" do
      @user = User.create(name: "Jane Doe", email: "jane.doe@gmail.com", password: "12345678", password_confirmation: "12345678888")
      expect(@user).not_to be_valid
    end

    it "emails must be unique" do
      @user1 = User.create(name: "Jason Doe", email: "json.doe@gmail.com", password: "12345678", password_confirmation: "12345678")
      @user2 = User.create(name: "Jayson Doe", email: "JSON.doe@gmail.com", password: "12345678", password_confirmation: "12345678")
      expect(@user2).not_to be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    it "should log a user in if provided with the correct credentials" do
      @user = User.create(name: "John Doe", email: "john.doe@gmail.com", password: "12345678", password_confirmation: "12345678")
      @user_check = User.authenticate_with_credentials(" John.DoE@gmail.com ", @user.password)
      expect(@user_check).to be_truthy
    end

    it "should return nil if a user attempts to login with the wrong credentials" do
      @user = User.create(name: "John Doe", email: "john.doe@gmail.com", password: "12345678", password_confirmation: "12345678")
      @user_check = User.authenticate_with_credentials(@user.email, "124524")
      expect(@user_check).to be_nil
    end
  end

end
