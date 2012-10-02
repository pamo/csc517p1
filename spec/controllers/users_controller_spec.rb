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
    @user2 = FactoryGirl.build(:user2)
    @admin = FactoryGirl.build(:user, name: "admin")
    @admin2 = FactoryGirl.build(:user, name: "AdminJoe")
  end

  describe "Create New User" do

     it "should create a new non-admin user" do
       put :create, :id => @user.id, :user => {}
       puts flash[:notice]
       response.should render_template(@user)
     end

      it "should create a new admin user" do
        @admin2 = FactoryGirl.create(:admin2)
        login(@admin)
        put :create, :id => @admin2.id, :user => {}
        puts flash[:notice]
        response.should render_template(@admin2)
      end
  end

  describe "Destroy User" do

    describe "when a user is not logged in" do
      it "should redirect to login page" do
        post :destroy, :id => @user.id
        puts flash[:notice]
        response.should redirect_to(login_path)
      end
    end
    describe "when a user is logged in" do

      it "should not destroy user if non-admin" do
        login(@user)
        @user2 = FactoryGirl.create(:user2)
        post :destroy, :id => @user2.id
        response.should_not be_success
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
      it "should destroy if admin user" do

        login(@admin)
        post :destroy, :id => @user.id
        puts flash[:notice]
        response.should redirect_to(users_path)
      end

    end
  end

  describe "Edit User" do

    it "should edit username" do

    end

    it "should edit password" do

    end

  end

  end


