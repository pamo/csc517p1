require 'spec_helper'

describe User do

  it "should require a username" do
    FactoryGirl.build(:user, :name => "").should_not be_valid
  end

  it "should require a password" do
    FactoryGirl.build(:user, :password =>"").should_not be_valid
  end

  it "should require matching passwords" do
    FactoryGirl.build(:user, :password =>"aaa", :password_confirmation => "bbb").should_not be_valid
  end

  it "should require a unique username" do
    FactoryGirl.create(:user)
    FactoryGirl.build(:user).should_not be_valid
  end
end