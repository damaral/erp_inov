require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe FornecedoresController do

  # This should return the minimal set of attributes required to create a valid
  # Fornecedor. As you add validations to Fornecedor, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    { "nome" => "MyString" }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # FornecedoresController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all fornecedores as @fornecedores" do
      fornecedor = Fornecedor.create! valid_attributes
      get :index, {}, valid_session
      assigns(:fornecedores).should eq([fornecedor])
    end
  end

  describe "GET show" do
    it "assigns the requested fornecedor as @fornecedor" do
      fornecedor = Fornecedor.create! valid_attributes
      get :show, {:id => fornecedor.to_param}, valid_session
      assigns(:fornecedor).should eq(fornecedor)
    end
  end

  describe "GET new" do
    it "assigns a new fornecedor as @fornecedor" do
      get :new, {}, valid_session
      assigns(:fornecedor).should be_a_new(Fornecedor)
    end
  end

  describe "GET edit" do
    it "assigns the requested fornecedor as @fornecedor" do
      fornecedor = Fornecedor.create! valid_attributes
      get :edit, {:id => fornecedor.to_param}, valid_session
      assigns(:fornecedor).should eq(fornecedor)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Fornecedor" do
        expect {
          post :create, {:fornecedor => valid_attributes}, valid_session
        }.to change(Fornecedor, :count).by(1)
      end

      it "assigns a newly created fornecedor as @fornecedor" do
        post :create, {:fornecedor => valid_attributes}, valid_session
        assigns(:fornecedor).should be_a(Fornecedor)
        assigns(:fornecedor).should be_persisted
      end

      it "redirects to the created fornecedor" do
        post :create, {:fornecedor => valid_attributes}, valid_session
        response.should redirect_to(Fornecedor.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved fornecedor as @fornecedor" do
        # Trigger the behavior that occurs when invalid params are submitted
        Fornecedor.any_instance.stub(:save).and_return(false)
        post :create, {:fornecedor => { "nome" => "invalid value" }}, valid_session
        assigns(:fornecedor).should be_a_new(Fornecedor)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Fornecedor.any_instance.stub(:save).and_return(false)
        post :create, {:fornecedor => { "nome" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested fornecedor" do
        fornecedor = Fornecedor.create! valid_attributes
        # Assuming there are no other fornecedores in the database, this
        # specifies that the Fornecedor created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Fornecedor.any_instance.should_receive(:update_attributes).with({ "nome" => "MyString" })
        put :update, {:id => fornecedor.to_param, :fornecedor => { "nome" => "MyString" }}, valid_session
      end

      it "assigns the requested fornecedor as @fornecedor" do
        fornecedor = Fornecedor.create! valid_attributes
        put :update, {:id => fornecedor.to_param, :fornecedor => valid_attributes}, valid_session
        assigns(:fornecedor).should eq(fornecedor)
      end

      it "redirects to the fornecedor" do
        fornecedor = Fornecedor.create! valid_attributes
        put :update, {:id => fornecedor.to_param, :fornecedor => valid_attributes}, valid_session
        response.should redirect_to(fornecedor)
      end
    end

    describe "with invalid params" do
      it "assigns the fornecedor as @fornecedor" do
        fornecedor = Fornecedor.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Fornecedor.any_instance.stub(:save).and_return(false)
        put :update, {:id => fornecedor.to_param, :fornecedor => { "nome" => "invalid value" }}, valid_session
        assigns(:fornecedor).should eq(fornecedor)
      end

      it "re-renders the 'edit' template" do
        fornecedor = Fornecedor.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Fornecedor.any_instance.stub(:save).and_return(false)
        put :update, {:id => fornecedor.to_param, :fornecedor => { "nome" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested fornecedor" do
      fornecedor = Fornecedor.create! valid_attributes
      expect {
        delete :destroy, {:id => fornecedor.to_param}, valid_session
      }.to change(Fornecedor, :count).by(-1)
    end

    it "redirects to the fornecedores list" do
      fornecedor = Fornecedor.create! valid_attributes
      delete :destroy, {:id => fornecedor.to_param}, valid_session
      response.should redirect_to(fornecedores_url)
    end
  end

end
