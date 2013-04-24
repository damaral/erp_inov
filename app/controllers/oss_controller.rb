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
