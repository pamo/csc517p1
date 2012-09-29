require 'spec_helper'
require_relative '../../spec/support/spec_test_helper'


describe CommentsController do
  render_views
  fixtures :all

  before(:each) do
    @user = FactoryGirl.build(:user)
    @admin = FactoryGirl.build(:user, name: "admin")
    login(@admin)
    #@post = FactoryGirl.create(:post, :id => current_user)
  end

=begin
    after(:each) do
      delete :destroy, :id => user
    end
=end

  describe "GET Index" do
    it "gets the index view" do
      get "index"
      response.status.should be 302
    end

    it "gets the correct index view template" do
      get "index"
      response.should redirect_to(comments_path)
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

=begin
      describe "with valid parameters" do

        it "with user should render new template" do
          login(@user)
          get :new
          response.should render_template("/posts/new")
        end
=end

=begin
        it "with admin should render new template" do
          login(@admin)
          get "new"
          response.should redirect_to(:action => "new")
        end
=end

    #end


  end

  describe "#create" do
    describe "with valid parameters" do
      it "creates a new comment object" do
        @post = FactoryGirl.build(:post, :id => current_user)
        @comment = FactoryGirl.build(:comment, :id => @post)
        put :create, :id => "1", :comment => {}
        @comment.should be_an_instance_of Comment
      end

      it "should allow user to add comment" do
        @post = FactoryGirl.create(:post, :id => current_user)
        @comment = FactoryGirl.create(:comment, :id => @post)
        put :create, :id => "1", :comment => {}
        #flash[:notice].should_not be_nil
        response.should redirect_to(post_path(@comment.post_id))
      end
                                         3

    end

  end



end


