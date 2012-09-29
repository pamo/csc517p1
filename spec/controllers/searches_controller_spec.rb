require_relative '../spec_helper'


describe SearchesController do
  describe "GET Index" do
    it "gets the index view" do
      get :index
      response.status.should be 200
    end

    it "gets the correct index view template" do
      get :index
      response.should render_template(:index)
    end
  end

  describe "GET New" do
    it "gets the new view" do
      get :new
      response.should render_template(:new)
    end
  end

=begin
  describe "GET Results" do
    it "gets the results view" do
      get :new
      assign(:search, "blog")
      render
      response.should render_template(:index)
    end
  end
=end
end