require 'spec_helper'


  describe Posts Object do

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
      @post = FactoryGirl(:post)
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

  describe "#edit" do
    it "edits the post object" do
      get "edit"
      response.should eql :success
    end
  end

  describe "#update" do
    it "updates the post object" do
      put "update"
      @update.content.should eql 'More Content'
      flash[:notice].should_not be_nil
    end
  end

  describe "#destroy" do
    it "destroys the post object" do
      get "destroy"
      @destroy.should eql nil
    end
  end


  #Validation Tests

  describe "should not save post with no content" do
    post = Post.new
    assert !post.save, "Saved post without content"
  end

  describe "should not save post without category" do
    post = Post.new
    assert !post.save, "Saved the post without category"
  end

  describe "should not save post without username" do
    post = Post.new
    assert !post.save, "Saved the post without username"
  end

  end


