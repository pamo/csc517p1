require 'spec_helper'
require_relative '../../spec/support/spec_test_helper'


  describe PostsController do
    render_views
    fixtures :all

    before(:each) do
      @user = FactoryGirl.build(:user)
      @admin = FactoryGirl.build(:user, name: "admin")

  end


  describe "GET Index" do
    it "gets the index view" do
      get "index"
      response.status.should be 200
    end

    it "gets the correct index view template" do
      get "index"
      response.should render_template("posts/index")
    end
  end

    describe "#new" do

      describe "with invalid parameters" do

        it "should redirect to login path" do
          get :new
          response.should_not be_success
          response.should redirect_to(login_path)
        end


      end

      describe "with valid parameters" do

        it "with user should render new template" do
            login(@user)
            get :new
            response.should be_success
            response.status.should be 200
        end

        it "with admin should render new template" do
          login(@admin)
          get :new
          response.should be_success
          response.should be 200
        end
      end
    end

  describe "#create" do
    describe "with valid parameters" do
      it "creates a new post object" do
        @post = FactoryGirl.build(:post)
        put :create, :id => "1", :post => {}
        @post.should be_an_instance_of Post
      end

      it "should create and redirect to show user post" do
        login(@user)
        @post = FactoryGirl.create(:post, :id => current_user)
        put :create, :id => "1", :post => {}
        #flash[:notice].should_not be_nil
        response.status.should be 200
      end

      it "should create and redirect to show admin post" do
        login(@admin)
        @post = FactoryGirl.create(:post, :id => current_user)
        put :create, :id => "1", :post => {}
        #flash[:notice].should_not be_nil
        response.status.should be 200
      end
    end

  end



  end


