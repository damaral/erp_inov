class FaturasController < ApplicationController
  before_filter :authenticate_funcionario!
  
  load_and_authorize_resource
  
  # GET /faturas
  # GET /faturas.json
  def index
    @faturas = Fatura.page(params[:page]).per(NUMERO_POR_PAGINA)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @faturas }
    end
  end

  # GET /faturas/1
  # GET /faturas/1.json
  def show
    @fatura = Fatura.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @fatura }
    end
  end

  # GET /faturas/new
  # GET /faturas/new.json
  def new
    @fatura = Fatura.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @fatura }
    end
  end

  # GET /faturas/1/edit
  def edit
    @fatura = Fatura.find(params[:id])
  end

  # POST /faturas
  # POST /faturas.json
  def create
    currency_to_number params[:fatura][:valor]
    currency_to_number params[:fatura][:multa]

    @fatura = Fatura.new(params[:fatura])

    respond_to do |format|
      if @fatura.save
        format.html { redirect_to @fatura, notice: 'Fatura foi criada com sucesso.' }
        format.json { render json: @fatura, status: :created, location: @fatura }
      else
        format.html { render action: "new" }
        format.json { render json: @fatura.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /faturas/1
  # PUT /faturas/1.json
  def update
    currency_to_number params[:fatura][:valor]
    currency_to_number params[:fatura][:multa]

    @fatura = Fatura.find(params[:id])

    respond_to do |format|
      if @fatura.update_attributes(params[:fatura])
        format.html { redirect_to @fatura, notice: 'Fatura foi atualizada com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @fatura.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /faturas/1
  # DELETE /faturas/1.json
  def destroy
    @fatura = Fatura.find(params[:id])
    @fatura.destroy

    respond_to do |format|
      format.html { redirect_to faturas_url }
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
