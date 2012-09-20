require 'spec_helper'

describe User do

  it "should require a username" do
    FactoryGirl.build(:user, :name => "").should_not be_valid
  end
end