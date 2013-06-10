class ProdutosController < ApplicationController
  before_filter :authenticate_funcionario!

  load_and_authorize_resource
  
  # GET /produtos
  # GET /produtos.json
  def index
    @produtos = Produto.page(params[:page]).per(NUMERO_POR_PAGINA)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @produtos }
    end
  end

  # GET /produtos/1
  # GET /produtos/1.json
  def show
    @produto = Produto.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @produto }
    end
  end

  # GET /produtos/new
  # GET /produtos/new.json
  def new
    @produto = Produto.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @produto }
    end
  end

  # GET /produtos/1/edit
  def edit
    @produto = Produto.find(params[:id])
  end

  # POST /produtos
  # POST /produtos.json
  def create
    currency_to_number params[:produto][:preco_unitario]
    currency_to_number params[:produto][:custo_unitario]

    @produto = Produto.new(params[:produto])

    respond_to do |format|
      if @produto.save
        format.html { redirect_to @produto, notice: 'Produto criado com sucesso.' }
        format.json { render json: @produto, status: :created, location: @produto }
      else
        format.html { render action: "new" }
        format.json { render json: @produto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /produtos/1
  # PUT /produtos/1.json
  def update
    currency_to_number params[:produto][:preco_unitario]
    currency_to_number params[:produto][:custo_unitario]

    @produto = Produto.find(params[:id])

    respond_to do |format|
      if @produto.update_attributes(params[:produto])
        format.html { redirect_to @produto, notice: 'Produto atualizado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @produto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /produtos/1
  # DELETE /produtos/1.json
  def destroy
    @produto = Produto.find(params[:id])
    @produto.destroy

    respond_to do |format|
      format.html { redirect_to produtos_url }
      format.json { head :no_content }
    end
  end

  private
  def currency_to_number(currency)
    currency.gsub!("R$", "")
    currency.strip!
    currency.gsub!(/,/, ".")
    currency = currency.to_f
  end
end
