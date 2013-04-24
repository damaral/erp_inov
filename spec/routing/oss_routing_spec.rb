require "spec_helper"

describe OssController do
  describe "routing" do

    it "routes to #index" do
      get("/oss").should route_to("oss#index")
    end

    it "routes to #new" do
      get("/oss/new").should route_to("oss#new")
    end

    it "routes to #show" do
      get("/oss/1").should route_to("oss#show", :id => "1")
    end

    it "routes to #edit" do
      get("/oss/1/edit").should route_to("oss#edit", :id => "1")
    end

    it "routes to #create" do
      post("/oss").should route_to("oss#create")
    end

    it "routes to #update" do
      put("/oss/1").should route_to("oss#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/oss/1").should route_to("oss#destroy", :id => "1")
    end

  end
end
