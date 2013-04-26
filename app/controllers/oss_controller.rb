class OssController < ApplicationController
  # GET /oss
  # GET /oss.json
  def index
    @oss = Os.all

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
    params[:os][:desconto].gsub!("R$ ", "")
    params[:os][:desconto].gsub!(/\./, "")
    params[:os][:desconto].gsub!(/,/, ".")
    params[:os][:desconto] = params[:os][:desconto].to_f
    puts "ITENS #{params[:os][:itens_attributes].inspect} ================================"

    valor_total = 0

    params[:os][:itens_attributes].each do |item|
      puts "ITENS #{item.inspect} ================================"
      produto = Produto.find item[1][:produto_id]
      item[1][:altura] = produto.altura unless produto.altura.nil?
      item[1][:comprimento] = produto.comprimento unless produto.comprimento.nil?

      item[1][:altura] = item[1][:altura].to_f/100
      item[1][:comprimento] = item[1][:comprimento].to_f/100

      if produto.unidade == Produto::PECA
        item[1][:sub_total] = item[1][:quantidade].to_i*produto.preco_unitario
      elsif produto.unidade == Produto::METRO_COMP
        item[1][:sub_total] = item[1][:quantidade].to_i*item[1][:comprimento].to_f*produto.preco_unitario
      elsif produto.unidade == Produto::METRO_ALT
        item[1][:sub_total] = item[1][:quantidade].to_i*item[1][:altura].to_f*produto.preco_unitario
      elsif produto.unidade == Produto::PECAMETRO_QUADRADO
        item[1][:sub_total] = item[1][:quantidade].to_i*item[1][:altura].to_f*item[1][:comprimento].to_f*produto.preco_unitario
      end

      valor_total += item[1][:sub_total]
    end
# ARRUMAR VALOR RESTANTE
    params[:os][:valor_restante] = 0
    params[:os][:valor_total] = valor_total - params[:os][:desconto]

    @os = Os.new(params[:os])

    respond_to do |format|
      if @os.save
        format.html { redirect_to @os, notice: 'Os was successfully created.' }
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
        format.html { redirect_to @os, notice: 'Os was successfully updated.' }
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
end
