require_relative '../helpers/spec_helper'


describe AdminController do
  describe "GET Index" do
    it "gets the index view" do
      get "index"
      response.status.should be 200
    end

    it "gets the correct index view template" do
      get "index"
      response.should render_template("admin/index")
    end
  end
end