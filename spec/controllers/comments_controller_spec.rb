require_relative '../spec_helper'


describe CommentsController do
=begin
  before(:each) do
    @user = FactoryGirl.build(:user)
    login(@user)
  end
=end
  describe "GET Index" do
    it "gets the index view" do
      get :index
      response.should render_template(:index)
    end
  end
end