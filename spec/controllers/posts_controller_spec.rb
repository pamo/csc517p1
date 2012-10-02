require 'spec_helper'
require_relative '../../spec/support/spec_test_helper'


  describe PostsController do
    render_views
    fixtures :all

    before(:each) do
      @admin = FactoryGirl.build(:user, :name => "admin")
      @user = FactoryGirl.build(:user)
      @post = FactoryGirl.build(:post)
      @post2 = FactoryGirl.build(:post)
    end

    after(:each) do
      @admin = nil
      @user = nil
      @post = nil
      @post2 = nil
    end


    describe "Create New Post" do

      describe "when a user is not logged in" do

        it "should not create a comment on the post page" do
          post :create, :id => @post.id, :post => {}
          response.should redirect_to(login_path)
        end

      end

      describe "when a user is logged in" do

        it "should create a post" do
          login(@user)
          put :create, :id => @post.id, :post => {:content => "dfafda"}
          puts flash[:notice]
          response.should render_template(@post)
        end
        it "should not allow a blank post" do
          login(@user)
          put :create, :id => @post.id
          puts flash[:notice]
          response.should render_template(@post)
        end
      end

      describe "Edit post" do
        describe "when a user is not logged in" do
          it "should redirect to login page" do
            @post = FactoryGirl.create(:post)
            post :update, :id => @post.id, :post => {:content => "adas"}
            response.should redirect_to(login_path)
          end
        end
        describe "when a user is logged in" do
          it "should edit the comment"  do
            login(@user)
            @post = FactoryGirl.create(:post)
            post :update, :id => @post.id, :post => {:content => "adas"}
            flash[:notice].should eq("Post was successfully updated.")
            response.should redirect_to(@post)
          end
        end
      end

      describe "Destroy post" do
        describe "when a user is not logged in" do
          it "should redirect to login page" do
            @post = FactoryGirl.create(:post)
            post :destroy, :id => @post.id
            puts flash[:notice]
            response.should redirect_to(login_path)
          end
        end
        describe "when a user is logged in" do
          it "should delete the post"  do
            login(@user)
            @post = FactoryGirl.create(:post)
            post :destroy, :id => @post.id
            puts flash[:notice]
            response.should redirect_to(posts_path)
          end
        end
      end


      describe "Vote for post" do
        describe "when a user is not logged in" do
          it "should redirect to login page" do
            @post = FactoryGirl.create(:post2)
            post :vote, :id => @post.id
            puts flash[:notice]
            response.should redirect_to(login_path)
          end
        end
        describe "when a user is logged in" do

          it "should edit the post"  do
            login(@user)
            @post2 = FactoryGirl.create(:post2)
            post :vote, :id => @post2.id

            flash[:notice].should eq("Your vote was cast")
            response.should redirect_to(@post2)
          end
          it "shouldn't allow a second vote" do
            login(@user)
            @post2 = FactoryGirl.create(:post2)
            post :vote, :id => @post2.id
            post :vote, :id => @post2.id
            flash[:notice].should eq("Your have already voted for this post")
            response.should redirect_to(@post2)
          end

        end
      end

    end



  end


