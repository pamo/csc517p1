require 'spec_helper'

describe Comment do

  it "should create a new comment" do
    FactoryGirl.build(:comment).should be_valid
  end

  it "should update a comment" do
    FactoryGirl.create(:comment, :body => "AAAAA").should be_valid
  end

  it "should require a username" do
    FactoryGirl.build(:comment, :username => "").should_not be_valid
  end

  it "should require body" do
    FactoryGirl.build(:comment, :body => "").should_not be_valid
  end

  it "should be associated with a post" do
    FactoryGirl.build(:comment, :post_id => "").should_not be_valid
  end

end
