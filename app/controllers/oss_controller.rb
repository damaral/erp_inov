# coding: utf-8

class OssController < ApplicationController
  # GET /oss
  # GET /oss.json
  def index
    @oss = Os.where("esta_pago = ? OR estado <> ?", false, Os::ESTADO_6).order("estado DESC").page(params[:page]).per(NUMERO_POR_PAGINA)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @oss }
    end
  end

  # GET /oss/1
  # GET /oss/1.json
  def show
    @os = Os.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @os }
    end
  end

  # GET /oss/new
  # GET /oss/new.json
  def new
    @os = Os.new
    @os.itens.build
    @os.pagamentos.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @os }
    end
  end

  # GET /oss/1/edit
  def edit
    @os = Os.find(params[:id])
  end

  # POST /oss
  # POST /oss.json
  def create
    currency_to_number params[:os][:pagamentos_attributes]["0"][:valor]

    params[:os][:itens_attributes].each do |item|
      currency_to_number item[1]["desconto"]
    end

    params[:os][:pagamentos_attributes]["0"][:cliente_id] = params[:os][:cliente_id]

    @os = Os.new(params[:os])

    respond_to do |format|
      if @os.save
        format.html { redirect_to @os, notice: 'Ordem de Serviço criada com sucesso.' }
        format.json { render json: @os, status: :created, location: @os }
      else
        format.html { render action: "new" }
        format.json { render json: @os.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /oss/1
  # PUT /oss/1.json
  def update
    params[:os][:pagamentos_attributes]["0"][:cliente_id] = params[:os][:cliente_id]
    
    @os = Os.find(params[:id])

    respond_to do |format|
      if @os.update_attributes(params[:os])
        format.html { redirect_to @os, notice: 'Ordem de Serviço atualizada com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @os.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /oss/1
  # DELETE /oss/1.json
  def destroy
    @os = Os.find(params[:id])
    @os.destroy

    respond_to do |format|
      format.html { redirect_to oss_url }
      format.json { head :no_content }
    end
  end

  def acao
    @os = Os.find(params[:id])

    Acao.create({:acao => params[:acao][:acao_realizada], :cliente_id => 1, :comentario => params[:acao][:comentario], :os_id => @os.id})

    if params[:acao][:acao_realizada].to_i == Acao::APROVAR_EXECUCAO
      @os.estado = Os::ESTADO_1
      notice = 'Aprovado a execução desta Ordem de Serviço.'

    elsif params[:acao][:acao_realizada].to_i == Acao::APROVAR_LAYOUT
      @os.estado = Os::ESTADO_4
      notice = 'Layout Aprovado com sucesso.'

    elsif params[:acao][:acao_realizada].to_i == Acao::REPROVAR_LAYOUT
      @os.estado = Os::ESTADO_3
      notice = 'Layout Reprovado com sucesso.'

    elsif params[:acao][:acao_realizada].to_i == Acao::FINALIZAR_OS
      @os.estado = Os::ESTADO_6
      notice = 'Ordem de Serviço finalizada com sucesso.'

    elsif params[:acao][:acao_realizada].to_i == Acao::ENTREGAR_OS
      @os.estado = Os::ESTADO_7
      notice = 'Ordem de Serviço entregue com sucesso.'

    end
      
    @os.save

    redirect_to @os, notice: notice
  end

  private
  def currency_to_number(currency)
    currency.gsub!("R$ ", "")
    currency.gsub!(/\./, "")
    currency.gsub!(/,/, ".")
    currency = currency.to_f
  end
end
