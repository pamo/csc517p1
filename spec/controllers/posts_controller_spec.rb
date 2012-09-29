require 'spec_helper'
require_relative '../../spec/support/spec_test_helper'


  describe PostsController do

    before(:each) do
      @user = FactoryGirl.build(:user)
      login(@user)
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

=begin
  describe "GET New" do
    it "gets the new view" do
      get "new"
      response.status.should be 200
    end

    it "gets the correct new post view template"
    response.should render_template("posts/new")
  end
=end

  describe "#create" do
    describe "with valid parameters" do
      it "creates a new post object" do
        @post = FactoryGirl.build(:post)
        put :create, :id => "1", :post => {}
        @post.should be_an_instance_of Post
       # flash[:notice].should_not be_nil
      end
    end

=begin
    describe "with invalid parameters" do

    end
=end

  end

=begin
  describe "#show" do
    it "shows the post object" do
      get "show"
      response.should eql :success
    end
  end
=end

=begin
  describe "#edit" do
    it "edits the post object" do
      get "edit"
      response.should eql :success
    end
  end
=end

  describe "#update" do
    describe "with valid parameters" do

      it "should find post and return object" do
        Post.should_receive(:find).with("1").and_return(@post)
        put :update, :id => "1", :post => {}
      end

      it "should update the post object's attributes" do
        @post.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1", :post => {}
      end

      it "should have a flash notice" do
        put :update, :id => "1", :post => {}
        flash[:notice].should_not be_blank
      end

      it "should have a successful flash notice" do
        put :update, :id => "1", :bird => {}
        flash[:notice].should eql 'Post was successfully updated.'
      end

      it "should redirect to the post's show page" do
        put :update, :id => "1", :post => {}
        response.should redirect_to(post_url(@post))
      end

    end

=begin
    describe "with invalid parameters" do

    end
=end
  end

=begin
  describe "#destroy" do
    it "destroys the post object" do
      get "destroy"
      @destroy = FactoryGirl(:post)
      @destroy.destroy
      @destroy.should eql nil
    end
  end
=end


  #Validation Tests
=begin

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
=end

  end


