class ClientesController < ApplicationController
  before_filter :authenticate_funcionario!
  
  load_and_authorize_resource

  helper_method :sort_column, :sort_direction

  has_scope :by_nome
  has_scope :by_apelido
  has_scope :by_email

  # GET /clientes
  # GET /clientes.json
  def index
    @clientes = apply_scopes(Cliente).order("#{sort_column} #{sort_direction}").page(params[:page]).per(NUMERO_POR_PAGINA)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @clientes }
    end
  end

  # GET /clientes/1
  # GET /clientes/1.json
  def show
    @cliente = Cliente.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cliente }
    end
  end

  # GET /clientes/new
  # GET /clientes/new.json
  def new
    @cliente = Cliente.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cliente }
    end
  end

  # GET /clientes/1/edit
  def edit
    @cliente = Cliente.find(params[:id])
  end

  # POST /clientes
  # POST /clientes.json
  def create
    @cliente = Cliente.new(params[:cliente])

    respond_to do |format|
      if @cliente.save
        format.html { redirect_to @cliente, notice: 'Cliente criado com sucesso.' }
        format.json { render json: @cliente, status: :created, location: @cliente }
      else
        format.html { render action: "new" }
        format.json { render json: @cliente.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /clientes/1
  # PUT /clientes/1.json
  def update
    @cliente = Cliente.find(params[:id])

    respond_to do |format|
      if @cliente.update_attributes(params[:cliente])
        format.html { redirect_to @cliente, notice: 'Cliente atualizado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cliente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clientes/1
  # DELETE /clientes/1.json
  def destroy
    @cliente = Cliente.find(params[:id])
    @cliente.destroy

    respond_to do |format|
      format.html { redirect_to clientes_url }
      format.json { head :no_content }
    end
  end

  private
  def sort_column
    Cliente.column_names.include?(params[:sort]) ? params[:sort] : "nome"
  end

  def sort_direction
    ["ASC", "DESC"].include?(params[:direction]) ? params[:direction] : "ASC"
  end
end
