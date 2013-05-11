# coding: utf-8
module Func
  class OssController < ApplicationController
    # GET /oss
    # GET /oss.json
    def index
      @oss = Os.where("estado > ? AND estado < ?", Os::ESTADO_0, Os::ESTADO_4).order("estado DESC").page(params[:page]).per(NUMERO_POR_PAGINA)

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

      Acao.create({:acao => params[:acao][:acao_realizada], :cliente_id => 1, :comentario => params[:acao][:comentario], :os_id => @os.id})

      if params[:acao][:acao_realizada].to_i == Acao::SUBMETER_LAYOUT
        @os.estado = Os::ESTADO_2
        notice = 'Layout submetido para aprovação.'

      elsif params[:acao][:acao_realizada].to_i == Acao::FINALIZAR_EXECUCAO
        @os.estado = Os::ESTADO_5
        notice = 'Ordem de Serviço Executada com sucesso.'

      end
        
      @os.save

      redirect_to func_os_path(@os), notice: notice
    end

    def submeter_para_aprovacao_layout
      @os = Os.find(params[:id])
      @os.estado = Os::ESTADO_2
      @os.save

      redirect_to func_os_path(@os), notice: 'Layout submetido para aprovação.'
    end

    def finalizar_execucao
      @os = Os.find(params[:id])
      @os.estado = Os::ESTADO_5
      @os.save

      redirect_to func_oss_path, notice: 'Ordem de Serviço Executada com sucesso.'
    end


    private
    def currency_to_number(currency)
      currency.gsub!("R$ ", "")
      currency.gsub!(/\./, "")
      currency.gsub!(/,/, ".")
      currency = currency.to_f
    end
  end
end