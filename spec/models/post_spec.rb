require 'spec_helper'

describe Post do

  it "should require a username" do
     FactoryGirl.build(:post, :username => "").should_not be_valid
  end

  it "should require content" do
    FactoryGirl.build(:post, :content => "").should_not be_valid
  end

  it "should require a category" do
    FactoryGirl.build(:post, :category => "", ).should_not be_valid
  end

end
