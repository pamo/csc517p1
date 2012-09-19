class AdminController < ApplicationController
  skip_before_filter :authorize

  # GET /admin
  def index
    @users = User.all()
    @posts = Post.all()
    @comments = Comment.all()
    @post_count = 0
    @post_comment_count = 0
    @post_vote_count = 0
    @count_admin_posts = 0
    @count_admin_comments = 0
    @admin_post_comment_count = 0
    @admin_post_vote_count = 0

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }

    end
  end
end
