class CommentsController < ApplicationController
  before_filter :is_admin?, :only => [:index]

  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comments }
    end
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /comments/new
  # GET /comments/new.json
  def new
    @comment = Comment.new
    @comment.post_id = params[:post_id]
    @comment.username = User.find(session[:user_id]).name

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(params[:comment])

    respond_to do |format|
      if @comment.save
        format.html { redirect_to post_path(@comment.post_id), notice: 'Comment was successfully created.' }
        format.json { render json: @comment, status: :created, location: @comment }
      else
        format.html { render action: "new" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /comments/1
  # PUT /comments/1.json
  def update
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to post_path(@comment.post_id), notice: 'Comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to post_path(@comment.post_id) }
      format.json { head :no_content }
    end
  end

  def search
    if params[:search_item]
      @comments = Comment.search (params[:search_item])
    else
      @comments = []

      respond_to do |format|
        format.html
        format.xml  {render xml: @users}
      end
    end

  end

  def vote
      @comment = Comment.find(params[:id])
      if not_current_user?(@comment.username)
        if Vote.find_by_uid_and_cid(session[:user_id], @comment.id)
          respond_to do |format|
            format.html { redirect_to post_path(@comment.post_id), notice: "Your have already voted for this comment" }
          end
      else
        @comment.votes += 1
        @vote = Vote.new
        @vote.uid = session[:user_id]
        @vote.cid = @comment.id

        respond_to do |format|
          if @comment.update_attributes(params[:comment]) && @vote.save
            format.html { redirect_to post_path(@comment.post_id), notice: "Your vote was cast" }
            format.json { head :no_content }
          end
        end
        end
      else
        respond_to do |format|
            format.html { redirect_to post_path(@comment.post_id), notice: "Your cannot vote for this comment" }
        end
      end
  end

  def show_who
    @comment = Comment.find(params[:id])
    @votes = Vote.find_all_by_cid(@comment.id)
    @voters = []
    @votes.each { | v | @voters << User.find_by_id(v.uid).name }

    respond_to do |format|
      if @votes.count
        format.html {redirect_to post_path(@comment.post_id), :flash => { :comment_voters => @voters.to_sentence} }
      end
    end
  end

end
