class PostsController < ApplicationController
  skip_before_filter :authorize, :only => [:index, :show]

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

  def vote
    @post = Post.find(params[:id])
    @post.votes += 1

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: "Your vote was cast" }
        format.json { head :no_content }
      else
        format.html { redirect_to @post, notice: "Your cannot vote for this post" }
        format.json { render json: @post }
      end
    end
  end
end
