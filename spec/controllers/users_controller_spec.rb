require 'spec_helper'
#require_relative '../../spec/support/spec_test_helper'

describe UsersController do
  render_views

  before(:each) do
    @user = FactoryGirl.build(:user)
    @admin = FactoryGirl.build(:admin)
  end


  describe "GET Index" do

    describe "with invalid parameters" do
      it "should redirect to login page" do
        get :index
        response.should_not be_success
        response.should redirect_to(login_path)
      end
    end

    describe "with valid parameters" do
      it "should get the user index view" do
        login(@user)
        get :index
        response.should be_success
      end

      it "should get the correct user index view" do
        login(@user)
        get :index
        response.status.should be 200
      end


    end
  end

  describe "GET New" do

     it "gets the new user view" do
        get :new
        response.status.should be 200
     end

      it "gets the correct new user view" do
        get :new
        response.should render_template("users/new")
      end
  end



end