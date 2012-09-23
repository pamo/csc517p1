require 'spec_helper'

describe Category do

  it "should create a new category" do
    FactoryGirl.build(:category).should be_valid
  end

  it "should update a category" do
    FactoryGirl.create(:category, :name => "Event").should be_valid
  end

  it "should require a category name" do
    FactoryGirl.build(:category, :name => "").should_not be_valid
  end

  #it "should require a unique category name" do
  #  FactoryGirl.build(:category).should_not be_valid
  #end
end
