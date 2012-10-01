require 'spec_helper'
require_relative '../../spec/support/spec_test_helper'

describe CommentsController do
  render_views
  fixtures :all

  before(:each) do
    @admin = FactoryGirl.build(:user, :name => "admin")
    @user = FactoryGirl.build(:user)
    @post = FactoryGirl.create(:post)
    @comment = FactoryGirl.build(:comment)
  end

  after(:each) do
    @admin = nil
    @user = nil
    @post = nil
    @comment = nil
  end

  describe "Create New Comment" do

    describe "when a user is not logged in" do

      it "should create a comment on the post page" do
        post :create, :id => "1", :comment => {}
        response.should redirect_to(login_path)
      end

    end

    describe "when a user is logged in" do

      it "should create a comment on the post page" do
        login(@user)
        put :create, :id => @comment.id, :comment => {:post_id => @post.id}
        response.should render_template(@post)
      end
      it "should not allow a blank comment" do
        login(@user)
        put :create, :id => @comment.id, :comment => {:post_id => @post.id}
        flash[:notice].should eq("Cannot submit blank comment!")
        response.should render_template(@post)
      end
    end

    describe "Edit comment" do
      describe "when a user is not logged in" do
        it "should redirect to login page" do
          @comment = FactoryGirl.create(:comment)
          post :update, :id => @comment.id, :comment => {:body => "adas"}
          response.should redirect_to(login_path)
        end
      end
      describe "when a user is logged in" do
        it "should edit the comment"  do
          login(@user)
          @comment = FactoryGirl.create(:comment)
          post :update, :id => @comment.id, :comment => {:body => "adas"}
          flash[:notice].should eq("Comment was successfully updated.")
          response.should redirect_to(@post)
          end
      end
    end

    describe "Destroy comment" do
      describe "when a user is not logged in" do
        it "should redirect to login page" do
          @comment = FactoryGirl.create(:comment)
          post :destroy, :id => @comment.id
          puts flash[:notice]
          response.should redirect_to(login_path)
        end
      end
      describe "when a user is logged in" do
        it "should delete the comment"  do
          login(@user)
          @comment = FactoryGirl.create(:comment)
          post :destroy, :id => @comment.id
          puts flash[:notice]
          response.should redirect_to(@post)
        end
      end
    end


    describe "Vote for comment" do
      describe "when a user is not logged in" do
        it "should redirect to login page" do
          @comment = FactoryGirl.create(:comment)
          post :vote, :id => @comment.id
          puts flash[:notice]
          response.should redirect_to(login_path)
        end
      end
      describe "when a user is logged in" do

        it "should edit the comment"  do
          login(@user)
          @comment = FactoryGirl.create(:comment)
          post :vote, :id => @comment.id

          flash[:notice].should eq("Your vote was cast")
          response.should redirect_to(@post)
        end
        it "shouldn't allow a second vote" do
          login(@user)
          @comment = FactoryGirl.create(:comment)
          post :vote, :id => @comment.id
          post :vote, :id => @comment.id
          flash[:notice].should eq("Your have already voted for this comment")
          response.should redirect_to(@post)
        end

      end
    end

  end

end