require 'spec_helper'
#require_relative '../../spec/support/spec_test_helper'

describe UsersController do
  render_views

  describe "GET Index" do
    user = FactoryGirl.build(:user)

    it "gets the index view" do
      puts "get index login(#{user.name})"
      login(user)
      get :index
      response.should be_success
    end

    it "gets the correct index view template" do
      get :index
      response.should render_template("users/index")
    end
  end

  #describe "GET New" do
  #  it "gets the new view" do
  #    get "new"
  #    response.status.should be 200
  #  end
  #
  #  it "gets the correct new post view template"
  #  response.should render_template("users/new")
  #end

  describe "#create" do
    #@user = FactoryGirl.build(:user)
    #@user.should be_an_instance_of User
    #flash[:notice].should_not be_nil
  end
end