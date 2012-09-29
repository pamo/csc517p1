require 'spec_helper'
require_relative '../../spec/support/spec_test_helper'


  describe PostsController do
    render_views

    before(:each) do
      @user = FactoryGirl.build(:user)
      @admin = FactoryGirl.build(:admin)
      #login(@user)
    end

=begin
    after(:each) do
      delete :destroy, :id => user
    end
=end

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
          get "new"
          response.should_not be_success
          response.should redirect_to(login_path)                                                                        3
        end

      end

      describe "with valid parameters" do

        it "with user should render new template" do
          login(@user)
          get "new"
          response.should render_template("/posts/new")
        end

=begin
        it "with admin should render new template" do
          login(@admin)
          get "new"
          response.should redirect_to(:action => "new")
        end
=end

      end


    end

  describe "#create" do
    describe "with valid parameters" do
      it "creates a new post object" do
        @post = FactoryGirl.build(:post)
        put :create, :id => "1", :post => {}
        @post.should be_an_instance_of Post
       # flash[:notice].should_not be_nil
      end
    end

  end



  end


