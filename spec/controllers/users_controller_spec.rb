require 'spec_helper'
require_relative '../../spec/support/spec_test_helper'


describe UsersController do
  render_views
  fixtures :all

  before(:each) do
    @admin = FactoryGirl.build(:user, :name => "admin")
    @user = FactoryGirl.build(:user)
  end

  after(:each) do
    @admin = nil
    @user = nil
  end


  describe "Create New User" do

    describe "when a user is not logged in" do

      it "should allow user to sign up" do
        get :new
        puts flash[:notice]
        response.should render_template(:new)
      end

      it "should not allow a blank form" do
        put :create, :id => @user.id, :user => {}
        response.should render_template(:new)
      end
    end

    describe "Edit user" do
      describe "when a user is not logged in" do
        it "should redirect to login page" do
          post :update, :id => @user.id, :user => {:name => "adas"}
          response.should redirect_to(login_path)
        end
      end
      describe "when a user is logged in" do
        it "should edit the user"  do
          login(@user)
          post :update, :id => @user.id, :user => {:name => "a new name"}
          flash[:notice].should eq("User a new name was successfully updated.")
          response.should redirect_to(@user)
        end
      end
    end

    describe "Destroy user" do
      describe "when a user is not logged in" do
        it "should redirect to login page" do
          post :destroy, :id => @user.id
          puts flash[:notice]
          response.should redirect_to(login_path)
        end
      end
      describe "when a user is logged in" do
        it "should not delete the last user"  do
          login(@user)
          post :destroy, :id => @user.id
          flash[:notice].should eq("Can't delete last user")
        end

        it "should delete the user if current user is admin" do
          @admin = FactoryGirl.create(:admin)
          login(@admin)
          post :destroy, :id => @user.id
          flash[:notice].should eq("User #{@user.name} deleted")
        end
      end
    end

  end

end


