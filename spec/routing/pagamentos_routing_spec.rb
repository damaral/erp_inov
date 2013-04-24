require "spec_helper"

describe PagamentosController do
  describe "routing" do

    it "routes to #index" do
      get("/pagamentos").should route_to("pagamentos#index")
    end

    it "routes to #new" do
      get("/pagamentos/new").should route_to("pagamentos#new")
    end

    it "routes to #show" do
      get("/pagamentos/1").should route_to("pagamentos#show", :id => "1")
    end

    it "routes to #edit" do
      get("/pagamentos/1/edit").should route_to("pagamentos#edit", :id => "1")
    end

    it "routes to #create" do
      post("/pagamentos").should route_to("pagamentos#create")
    end

    it "routes to #update" do
      put("/pagamentos/1").should route_to("pagamentos#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/pagamentos/1").should route_to("pagamentos#destroy", :id => "1")
    end

  end
end
