class PostsController < ApplicationController
  skip_before_filter :authorize, :only => [:index, :show, :search]

  # belongs_to :user
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all()
    @posts = Post.order('updated_at desc')


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])
    @comment = Comment.new(:post => @post)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new
    @post.username = current_user

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(params[:post])

    if session[:user_id]
      @post.username = User.find(session[:user_id]).name
    end
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  def search
    if params[:search_item]
      @posts = Post.search (params[:search_item])
    else
      @posts = []

      respond_to do |format|
        format.html
        format.xml  {render xml: @users}
      end
    end

  end

  # TODO Add restrictions for multiple voting on post

  def vote
    @post = Post.find(params[:id])
    if not_current_user?(@post.username)
      if Vote.find_by_uid_and_pid(session[:user_id], @post.id)
        respond_to do |format|
          format.html { redirect_to @post, notice: "Your have already voted for this comment" }
        end
      else
        @post.votes += 1
        @vote = Vote.new
        @vote.uid = session[:user_id]
        @vote.pid = @post.id

        respond_to do |format|
          if @post.update_attributes(params[:post]) && @vote.save
            format.html { redirect_to @post, notice: "Your vote was cast" }
          end
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to @post, notice: "Your cannot vote for this post" }
      end
    end
  end
end
