require 'spec_helper'
require_relative '../../spec/support/spec_test_helper'


describe CategoriesController do
  render_views
  describe "GET Index" do
    it "gets the index view" do
      @user = FactoryGirl.build(:user)
      login(@user)
      get :index
      response.status.should be 200
      response.should render_template("categories/index")
    end
  end
  describe "Create Category" do

    it "gets the new view" do
      @category = FactoryGirl.build(:category)
      @admin = FactoryGirl.build(:user, name: "admin")
      login(@admin)
      get :new
      response.should render_template(:new)
    end

    it "creates a new category" do
      @category = FactoryGirl.build(:category)
      @admin = FactoryGirl.build(:user, name: "admin")
      login(@admin)
      put :create, :name => @category.name
      response.should render_template(@category)

    end

    it "updates a category" do
      @category = FactoryGirl.create(:category)
      @admin = FactoryGirl.build(:user, name: "admin")
      login(@admin)
      put :update, { :id => @category.id, :category => { :name => "" } }
      response.should render_template(:edit)

    end

    it "destroys a category" do
      @category = FactoryGirl.create(:category)
      @admin = FactoryGirl.build(:user, name: "admin")
      login(@admin)
      put :destroy, { :id => @category.id }
      response.should redirect_to(categories_url)
    end

  end
end