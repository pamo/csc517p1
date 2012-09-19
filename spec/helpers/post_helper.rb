define "Post" do
  before(:each) do
    @post = Post.new :content => "Content", :username => "Username"
    @update = @post.update :content => "More Content"
    @destroy = @post.destroy
  end
end