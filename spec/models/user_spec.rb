require 'spec_helper'

describe User do

  describe "associations" do
    it { should have_many(:deviations) }
  end

  context "validates presence" do
    let(:incomplete_user) { User.new }

    it "validates presence of username" do
      expect(incomplete_user).to have(1).error_on(:username)
    end

    it "validates presence of password_digest" do
      expect(incomplete_user).to have(1).error_on(:password_digest)
    end

    it "validates presence of email" do
      expect(incomplete_user).to have(1).error_on(:email)
    end

    it "validates presence of country" do
      expect(incomplete_user).to have(1).error_on(:country)
    end

    it "validates presence of date_of_birth" do
      expect(incomplete_user).to have(1).error_on(:date_of_birth)
    end
  end

  context "validates uniqueness" do
    it "validates uniqueness of username" do
      user1 = User.create!({
        username: "name",
        email: "name@name.com",
        password_digest: BCrypt::Password.create("password"),
        token: User.create_token,
        gender: "M",
        date_of_birth: "2014-04-21",
        country: "United States",
        biography: "lol hi"
      })

      user2 = User.new({
        username: "name",
        email: "name2@name.com",
        password_digest: BCrypt::Password.create("password"),
        token: User.create_token,
        gender: "M",
        date_of_birth: "2014-04-21",
        country: "United States",
        biography: "lol hi"
      })

      expect(user2).not_to be_valid

    end

    it "validates uniqueness of email" do
      user1 = User.create!({
        username: "name",
        email: "name@name.com",
        password_digest: BCrypt::Password.create("password"),
        token: User.create_token,
        gender: "M",
        date_of_birth: "2014-04-21",
        country: "United States",
        biography: "lol hi"
      })

      user2 = User.new({
        username: "name2",
        email: "name@name.com",
        password_digest: BCrypt::Password.create("password"),
        token: User.create_token,
        gender: "M",
        date_of_birth: "2014-04-21",
        country: "United States",
        biography: "lol hi"
      })

      expect(user2).not_to be_valid
    end
  end

  context "validates password edge cases" do
    it "checks if password and password confirmation are the same" do
      user = User.new({
        username: "name2",
        email: "name@name.com",
        password: "password",
        conf_password: "other_password",
        token: User.create_token,
        gender: "M",
        date_of_birth: "2014-04-21",
        country: "United States",
        biography: "lol hi"
      })

      user2 = User.new({
        username: "name2",
        email: "name@name.com",
        password: "password",
        conf_password: "password",
        token: User.create_token,
        gender: "M",
        date_of_birth: "2014-04-21",
        country: "United States",
        biography: "lol hi"
      })

      expect(user).not_to be_valid
      expect(user2).to be_valid
    end

    it "validates password length" do
      user = User.new({
        username: "name2",
        email: "name@name.com",
        password: "secret",
        conf_password: "secret",
        token: User.create_token,
        gender: "M",
        date_of_birth: "2014-04-21",
        country: "United States",
        biography: "lol hi"
      })

      user2 = User.new({
        username: "name2",
        email: "name@name.com",
        password: "large_secret",
        conf_password: "large_secret",
        token: User.create_token,
        gender: "M",
        date_of_birth: "2014-04-21",
        country: "United States",
        biography: "lol hi"
      })

      expect(user).not_to be_valid
      expect(user2).to be_valid
    end
  end
end