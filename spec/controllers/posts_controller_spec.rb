require_relative '../helpers/spec_helper'
require_relative '../helpers/post_helper'

define "Post" do
  before(:each) do
    @post = Post.new "Content", "Username"
  end
end

describe PostsController do
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

  describe "GET New" do
    it "gets the new view" do
      get "new"
      response.status.should be 200
    end

    it "gets the correct new post view template"
    response.should render_template("posts/new")
  end

  describe "#create" do
    it "creates a new post object" do
      @post.should be_an_instance_of Post
      flash[:notice].should_not be_nil
    end
  end

  describe "#show" do
    it "shows the post object" do
      get "show"
      response.should eql :success
    end
  end





end