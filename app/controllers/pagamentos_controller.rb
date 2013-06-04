class PagamentosController < ApplicationController
  before_filter :authenticate_funcionario!
  # GET /pagamentos
  # GET /pagamentos.json
  def index
    @pagamentos = Pagamento.page(params[:page]).per(NUMERO_POR_PAGINA)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pagamentos }
    end
  end

  # GET /pagamentos/1
  # GET /pagamentos/1.json
  def show
    @pagamento = Pagamento.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pagamento }
    end
  end

  # GET /pagamentos/new
  # GET /pagamentos/new.json
  def new
    puts params
    @pagamento = Pagamento.new
    @pagamento.os_id = params[:os_id] unless params[:os_id].nil?

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pagamento }
    end
  end

  # GET /pagamentos/1/edit
  def edit
    @pagamento = Pagamento.find(params[:id])
  end

  # POST /pagamentos
  # POST /pagamentos.json
  def create
    currency_to_number params[:pagamento][:valor]

    @pagamento = Pagamento.new(params[:pagamento])

    respond_to do |format|
      if @pagamento.save
        #format.html { redirect_to @pagamento, notice: 'Pagamento criado com sucesso.' }
        format.html { redirect_to @pagamento.os, notice: 'Pagamento criado com sucesso.' }
        format.json { render json: @pagamento, status: :created, location: @pagamento }
      else
        format.html { render action: "new" }
        format.json { render json: @pagamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pagamentos/1
  # PUT /pagamentos/1.json
  def update
    currency_to_number params[:pagamento][:valor]

    @pagamento = Pagamento.find(params[:id])

    respond_to do |format|
      if @pagamento.update_attributes(params[:pagamento])
        #format.html { redirect_to @pagamento, notice: 'Pagamento atualizado com sucesso.' }
        format.html { redirect_to @pagamento.os, notice: 'Pagamento atualizado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pagamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pagamentos/1
  # DELETE /pagamentos/1.json
  def destroy
    @pagamento = Pagamento.find(params[:id])
    os = @pagamento.os
    @pagamento.destroy

    respond_to do |format|
      #format.html { redirect_to pagamentos_url }
      format.html { redirect_to os }
      format.json { head :no_content }
    end
  end

  def confirmar
    @pagamento = Pagamento.find(params[:id])
    @pagamento.esta_pago = true
    @pagamento.save

    redirect_to os_path(@pagamento.os)
  end

  private
  def currency_to_number(currency)
    currency.gsub!("R$", "")
    currency.strip!
    currency.gsub!(/,/, ".")
    currency = currency.to_f
  end
end
