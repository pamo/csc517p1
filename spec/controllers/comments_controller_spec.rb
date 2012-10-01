require 'spec_helper'
require_relative '../../spec/support/spec_test_helper'

describe CommentsController do
  render_views
  fixtures :all

  before(:each) do
    @user = FactoryGirl.build(:user, :name => "admin")
    @post = FactoryGirl.create(:post)
    @comment = FactoryGirl.build(:comment)
  end

  describe "Create New Comment" do

    describe "when a user is not logged in" do

      it "should redirect to login path" do
        post :create, :id => "1", :comment => {}
        response.should redirect_to(login_path)
      end

    end

<<<<<<< HEAD
    describe "when a user is logged in" do
      it "should allow user to add comment" do
        login(@user)
        post :create, :id => "1", :comment => {}
        #response.should have_tag("form#new_comment")
        #response.should redirect_to(post_path(:post_id))
        flash[:notice].should_not be_nil

      end

    end
=======
>>>>>>> Removed test because we're going to test in posts controller instead
  end

end