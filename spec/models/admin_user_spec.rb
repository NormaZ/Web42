require 'rails_helper'

RSpec.describe AdminUser, :type => :model do
  
  subject(:admin_user) { FactoryGirl.build :admin_user }
  
  describe "Methods" do

    describe "#to_s" do
      it "should return the correct string" do
        admin_user.login = "foo"
        admin_user.email = "foo@bar.com"
        expect(admin_user.to_s).to match /foo - foo@bar.com/
      end
    end

  end

  describe "Validations" do

    context "email" do

      it "should be unique" do
        expect(admin_user).to validate_uniqueness_of :email
      end
 
      it "should be present" do
        expect(admin_user).to validate_presence_of :email
      end

    end

    context "login" do

      it "should be unique" do
        expect(admin_user).to validate_uniqueness_of :login
      end

      it "should be present" do
        expect(admin_user).to validate_presence_of :login
      end

    end

    context "password" do

      it "should be of length 8 minimum" do
        expect(admin_user).to ensure_length_of(:password).is_at_least(8)
      end

      context "should be valid if" do
        it "contains a capital letter, miniscule letter and a digit" do
          expect(admin_user).to allow_value('p1ZwRjw6').for :password
        end
      end

      context "should not be valid if" do
        it "does not contain a digit" do
          expect(admin_user).to_not allow_value('Helloworld').for :password
        end

        it "does not contain a capital letter" do
          expect(admin_user).to_not allow_value('helloworld123').for :password
        end

        it "does not contain a miniscule letter" do
          expect(admin_user).to_not allow_value('HELLOWORLD123').for :password
        end

      end

    end

  end

end
