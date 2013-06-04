# coding: utf-8

class OssController < ApplicationController
  before_filter :authenticate_funcionario!

  helper_method :sort_column, :sort_direction

  has_scope :by_id
  has_scope :by_cliente
  has_scope :by_previsao_entrega
  has_scope :by_esta_pago
  has_scope :exibicao, :default => Os::ESTADO_7

  # GET /oss
  # GET /oss.json
  def index
    @oss = apply_scopes(Os).order("#{sort_column} #{sort_direction}").page(params[:page]).per(NUMERO_POR_PAGINA)

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

    if @os.pagamentos.blank?
      @os.pagamentos.build
    end
  end

  # POST /oss
  # POST /oss.json
  def create
    #params[:os][:pagamentos_attributes].each do |pagamento|
    #  currency_to_number pagamento[1]["valor"]
    #  puts "VALOR = #{pagamento[1]["valor"]}"
    #end

    params[:os][:itens_attributes].each do |item|
      currency_to_number item[1]["desconto"]
    end

    #params[:os][:pagamentos_attributes]["0"][:cliente_id] = params[:os][:cliente_id]

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
    #params[:os][:pagamentos_attributes].each do |pagamento|
    #  currency_to_number pagamento[1]["valor"]
    #end

    params[:os][:itens_attributes].each do |item|
      currency_to_number item[1]["desconto"]
    end
    
    #params[:os][:pagamentos_attributes]["0"][:cliente_id] = params[:os][:cliente_id]
    
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
    currency.gsub!("R$", "")
    currency.strip!
    currency.gsub!(/,/, ".")
    currency = currency.to_f
  end

  def sort_column
    Os.column_names.include?(params[:sort]) ? params[:sort] : "estado"
  end

  def sort_direction
    ["ASC", "DESC"].include?(params[:direction]) ? params[:direction] : "DESC"
  end
end
