class FornecedoresController < ApplicationController
  before_filter :authenticate_funcionario!
  
  load_and_authorize_resource
  
  # GET /fornecedores
  # GET /fornecedores.json
  def index
    @fornecedores = Fornecedor.page(params[:page]).per(NUMERO_POR_PAGINA)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @fornecedores }
    end
  end

  # GET /fornecedores/1
  # GET /fornecedores/1.json
  def show
    @fornecedor = Fornecedor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @fornecedor }
    end
  end

  # GET /fornecedores/new
  # GET /fornecedores/new.json
  def new
    @fornecedor = Fornecedor.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @fornecedor }
    end
  end

  # GET /fornecedores/1/edit
  def edit
    @fornecedor = Fornecedor.find(params[:id])
  end

  # POST /fornecedores
  # POST /fornecedores.json
  def create
    @fornecedor = Fornecedor.new(params[:fornecedor])

    respond_to do |format|
      if @fornecedor.save
        format.html { redirect_to @fornecedor, notice: 'Fornecedor criado com sucesso.' }
        format.json { render json: @fornecedor, status: :created, location: @fornecedor }
      else
        format.html { render action: "new" }
        format.json { render json: @fornecedor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /fornecedores/1
  # PUT /fornecedores/1.json
  def update
    @fornecedor = Fornecedor.find(params[:id])

    respond_to do |format|
      if @fornecedor.update_attributes(params[:fornecedor])
        format.html { redirect_to @fornecedor, notice: 'Fornecedor atualizado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @fornecedor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fornecedores/1
  # DELETE /fornecedores/1.json
  def destroy
    @fornecedor = Fornecedor.find(params[:id])
    @fornecedor.destroy

    respond_to do |format|
      format.html { redirect_to fornecedores_url }
      format.json { head :no_content }
    end
  end
end
