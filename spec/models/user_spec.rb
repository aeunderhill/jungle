require 'rails_helper'

RSpec.describe User, type: :model do
 
  
  describe 'Validations' do
    context 'checking for content' do

      it "is valid with valid attributes of first/last name, password/password_confirmation and email" do
        @user = User.create(name: 'bob', password: '1234', password_confirmation: '1234', email: 'test')

        expect(@user).to be_valid
      end

      it "is invalid with name as nil" do
        @user = User.create(name: nil, password: 'test', password_confirmation: 'test', email: 'test')

        expect(@user.errors.full_messages.length == 1)
        expect(@user.errors.full_messages[0] == "Name can't be blank")
        expect(@user).to_not be_valid
      end


      it "is invalid with no password" do
        @user = User.create(name: 'test', password: nil, password_confirmation: 'test', email: 'test')

        expect(@user.errors.full_messages.length == 1)
        expect(@user.errors.full_messages[0] == "password can't be blank")
        expect(@user).to_not be_valid
      end

      it "is invalid with no password confirmation" do
        @user = User.create(name: 'test', password: 'test', password_confirmation: nil, email: 'test')

        expect(@user.errors.full_messages.length == 1)
        expect(@user.errors.full_messages[0] == "Password_confirmation can't be blank")
        expect(@user).to_not be_valid
      end

      it "is invalid with no email" do
        @user = User.create(name: 'test', password: 'test', password_confirmation: 'test', email: nil)

        expect(@user.errors.full_messages.length == 1)
        expect(@user.errors.full_messages[0] == "email can't be blank")
        expect(@user).to_not be_valid
      end

    end
   
  end
end

