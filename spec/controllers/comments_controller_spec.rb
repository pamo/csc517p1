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
  end

end