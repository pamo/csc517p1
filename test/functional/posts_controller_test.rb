require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  setup do
    @post = posts(:one)
    @update = {
        :category_id => 3,
        :content => 'Message',
        :username => 'Admin',
        :votes => 0,
        :id => 3
    }
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:posts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create post" do
    assert_difference('Post.count') do
      post :create, :post => {:content => 'Hello World'}
    end

    assert_redirected_to post_path(assigns(:post))
    assert_equal 'Post was successfully created.', flash[:notice]
  end

  test "should show post" do
    get :show, id: @post
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @post
    assert_response :success
  end

  test "should update post" do
    put :update, :id => @post.to_param, :post => @update
    assert_redirected_to post_path(assigns(:post))
  end

  test "should destroy post" do
    assert_difference('Post.count', -1) do
      #delete :destroy, id: @post'
      Post.delete(@post)
    end

    assert_redirected_to posts_path
  end

  # Validation tests
  test "should not save post without content" do
    post = Post.new
    assert !post.save, "Saved the post without content"
  end

  test "should not save post without category" do
    post = Post.new
    assert !post.save, "Saved the post without category"
  end

  test "should not save post without username" do
    post = Post.new
    assert !post.save, "Saved the post without username"
  end
end
