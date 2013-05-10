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
    currency_to_number params[:os][:desconto]
    currency_to_number params[:os][:pagamentos_attributes]["0"][:valor]

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

    Acao.create({:acao => params[:commit], :cliente_id => 1, :comentario => params[:acao][:comentario], :os_id => @os.id})

    if params[:commit] == Acao::APROVAR_EXECUCAO
      @os.estado = Os::ESTADO_1
      notice = 'Aprovado a execução desta Ordem de Serviço.'

    elsif params[:commit] == Acao::APROVAR_LAYOUT
      @os.estado = Os::ESTADO_4
      notice = 'Layout Aprovado com sucesso.'

    elsif params[:commit] == Acao::REPROVAR_LAYOUT
      @os.estado = Os::ESTADO_3
      notice = 'Layout Reprovado com sucesso.'

    elsif params[:commit] == Acao::FINALIZAR_OS
      @os.estado = Os::ESTADO_6
      notice = 'Ordem de Serviço finalizada com sucesso.'

    elsif params[:commit] == Acao::ENTREGAR_OS
      @os.estado = Os::ESTADO_7
      notice = 'Ordem de Serviço entregue com sucesso.'

    end
      
    @os.save

    redirect_to @os, notice: notice
  end

  def aprovar_execucao
    @os = Os.find(params[:id])
    @os.estado = Os::ESTADO_1
    @os.save

    redirect_to @os, notice: 'Aprovado a execução desta Ordem de Serviço.'
  end

  def aprovar_layout
    @os = Os.find(params[:id])
    @os.estado = Os::ESTADO_4
    @os.save

    redirect_to @os, notice: 'Layout Aprovado com sucesso.'
  end

  def reprovar_layout
    @os = Os.find(params[:id])
    @os.estado = Os::ESTADO_3
    @os.save

    redirect_to @os, notice: 'Layout Reprovado com sucesso.'
  end

  def finalizar
    @os = Os.find(params[:id])
    @os.estado = Os::ESTADO_6
    @os.save

    redirect_to @os, notice: 'Ordem de Serviço finalizada com sucesso.'
  end

  def entregar
    @os = Os.find(params[:id])
    @os.estado = Os::ESTADO_7
    @os.save

    redirect_to oss_path, notice: 'Ordem de Serviço entregue com sucesso.'
  end

  private
  def currency_to_number(currency)
    currency.gsub!("R$ ", "")
    currency.gsub!(/\./, "")
    currency.gsub!(/,/, ".")
    currency = currency.to_f
  end
end
