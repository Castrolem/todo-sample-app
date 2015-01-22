require 'rails_helper'

RSpec.describe User, :type => :model do
  let(:user) { User.new(name: "Example User", email: "user@example.com",
                        password: "foobar", password_confirmation: "foobar") }

  it "should be valid" do
    expect(user).to be_valid
  end

  it { should respond_to(:password_confirmation) }
  it { should respond_to(:remember_token) }
  it { should respond_to(:authenticate) }

  context "authenticated?" do
    it "should return false for a user with nil digest" do
      expect(user.authenticated?('')).to be false
    end
  end

  describe "name" do
    it "should be present" do
      user.name = "     "
      expect(user).to_not be_valid
    end

    it "should not be too long" do
      user.name = "a" * 51
      expect(user).to_not be_valid
    end
  end

  describe "email" do
    it "should be present" do
      user.email = "     "
      expect(user).to_not be_valid
    end

    it "should not be too long" do
      user.email = "a" * 244 + "@example.com"
      expect(user).to_not be_valid
    end

    it "validation should accept valid addresses" do
      valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                        first.last@foo.jp alice+bob@baz.cn]
      valid_addresses.each do |valid_address|
        user.email = valid_address
        expect(user).to be_valid, "#{valid_address.inspect} should be valid"
      end
    end

    it "validation should reject invalid addresses" do
      invalid_addresses = %w[user@example,com user_at_foo.org
                             user.name@example.foo@bar_baz.com foo@bar+baz.com]
      invalid_addresses.each do |invalid_address|
        user.email = invalid_address
        expect(user).to_not be_valid, "#{invalid_address.inspect} should be invalid"
      end
    end

    it "addresses should be unique" do
      duplicate_user = user.dup
      duplicate_user.email = user.email.upcase
      user.save
      expect(duplicate_user).to_not be_valid
    end

    it "email addresses should be saved as lower-case" do
      mixed_case_email = "Foo@ExAMPle.CoM"
      user.email = mixed_case_email
      user.save
      expect(mixed_case_email.downcase).to eq(user.reload.email)
    end
  end

  context "password" do
    it "should have a minimum length" do
      user.password = user.password_confirmation = "a" * 5
      expect(user).to_not be_valid
    end
  end
end
