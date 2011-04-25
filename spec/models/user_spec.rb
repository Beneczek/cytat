require 'spec_helper'

describe User do

  before(:each) do
    @attr = { :name => "Example User", :email => "onet@p.lodz.pl" }
  end

  it "should create a new instance given valid attributes" do
    User.create!(@attr)
  end

  it "should require a name" do
    no_name_user = User.new(@attr.merge(:name => ""))
    no_name_user.should_not be_valid
  end

  it "should require an email address" do
    no_email_user = User.new(@attr.merge(:email => ""))
    no_email_user.should_not be_valid
  end

  it "should reject names that are too long" do
    long_name = "a" * 51
    long_name_user = User.new(@attr.merge(:name => long_name))
    long_name_user.should_not be_valid
  end

  it "should reject names that are too short" do
    short_name = "a" * 5
    short_name_user = User.new(@attr.merge(:name => short_name))
    short_name_user.should_not be_valid
  end

  it "should reject wrong email addresses" do
    user_with_duplicate_email = User.new(@attr.merge(:email => "test@test.pl"))
    user_with_duplicate_email.should_not be_valid
  end

  it "should reject duplicate email addresses" do
    # Put a user with given email address into the database.
    User.create!(@attr)
    user_with_duplicate_email = User.new(@attr)
    user_with_duplicate_email.should_not be_valid
  end

end
