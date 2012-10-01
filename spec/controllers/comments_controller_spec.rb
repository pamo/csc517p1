require 'spec_helper'
require_relative '../../spec/support/spec_test_helper'

describe CommentsController do
  render_views
  fixtures :all

  before(:each) do
    @user = FactoryGirl.build(:user)
    @post = FactoryGirl.build(:post)
    @comment = FactoryGirl.build(:comment)
  end

  describe "Create New Comment" do

    describe "when a user is not logged in" do

      it "should redirect to login path" do
        get :create
        response.should redirect_to(:login)
      end

    end

    describe "when a user is logged in" do
      #login(:user)
      it "should allow user to add comment" do
        put :create, :id => "1", :comment => {}
        #flash[:notice].should_not be_nil
        response.should redirect_to(post_path(@comment.post_id))
      end


    end
  end

end