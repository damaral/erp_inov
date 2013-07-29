require "spec_helper"

describe FaturasController do
  describe "routing" do

    it "routes to #index" do
      get("/faturas").should route_to("faturas#index")
    end

    it "routes to #new" do
      get("/faturas/new").should route_to("faturas#new")
    end

    it "routes to #show" do
      get("/faturas/1").should route_to("faturas#show", :id => "1")
    end

    it "routes to #edit" do
      get("/faturas/1/edit").should route_to("faturas#edit", :id => "1")
    end

    it "routes to #create" do
      post("/faturas").should route_to("faturas#create")
    end

    it "routes to #update" do
      put("/faturas/1").should route_to("faturas#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/faturas/1").should route_to("faturas#destroy", :id => "1")
    end

  end
end
