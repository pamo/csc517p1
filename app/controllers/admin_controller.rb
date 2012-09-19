class AdminController < ApplicationController
  skip_before_filter :authorize
  helper_method :post_votes, :comment_votes

  # GET /admin
  def index
    @users = User.all()

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }

    end
  end

  def post_votes(user)
    @post_votes = 0
    Post.find_all_by_username(user).each do |p|
      puts "post_votes"
      @post_votes += Vote.count(:all, :conditions => {"pid" => p.id} )
    end
    return @post_votes
  end

  def comment_votes(user)
    @comment_votes = 0
    Comment.find_all_by_username(user).each do |c|
      @comment_votes += Vote.count(:all, :conditions => {"cid" => c.id} )
    end
    return @comment_votes
  end
end
