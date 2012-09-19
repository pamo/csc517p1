require_relative '../helpers/spec_helper'
require_relative '../helpers/post_helper'

describe PostsController do
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
    it "creates new post" do
      get "new"
      response.status.should be 200
    end

    it "gets the correct new post view template"
    response.should render_template("posts/new")
  end



end