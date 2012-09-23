require 'spec_helper'

describe Post do

  it "should create a new post" do
    FactoryGirl.build(:post).should be_valid
  end

  it "should update a post" do
    FactoryGirl.create(:post, :content => "AAAAA").should be_valid
  end

  it "should require a username" do
     FactoryGirl.build(:post, :username => "").should_not be_valid
  end

  it "should require content" do
    FactoryGirl.build(:post, :content => "").should_not be_valid
  end

  it "should require a category" do
    FactoryGirl.build(:post, :category_id => "").should_not be_valid
  end

end
