class RemoteNafamasController < ApplicationController

  before_action :authenticate_user!
  layout "dashboard"


  before_action :set_remote_nafama, only: [:show, :edit, :update, :destroy]

  # GET /remote_nafamas
  # GET /remote_nafamas.json
  def index
    @remote_nafamas = RemoteNafama.all
  end

  # GET /remote_nafamas/1
  # GET /remote_nafamas/1.json
  def show
  end

  # GET /remote_nafamas/new
  def new
    @customers = Customer.all
    @remote_nafama = RemoteNafama.new
  end

  # GET /remote_nafamas/1/edit
  def edit
    @customers = Customer.all
  end

  # POST /remote_nafamas
  # POST /remote_nafamas.json
  def create
    @remote_nafama = current_user.remote_nafamas.build(remote_nafama_params)

    respond_to do |format|
      if @remote_nafama.save
        @remote_nafamas = RemoteNafama.all
        format.html { redirect_to @remote_nafama, notice: 'Remote nafama was successfully created.' }
        format.json { render :show, status: :created, location: @remote_nafama }
        format.js
      else
        format.html { render :new }
        format.json { render json: @remote_nafama.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /remote_nafamas/1
  # PATCH/PUT /remote_nafamas/1.json
  def update
    respond_to do |format|
      if @remote_nafama.update(remote_nafama_params)
        @remote_nafamas = RemoteNafama.all

        format.html { redirect_to @remote_nafama, notice: 'Remote nafama was successfully updated.' }
        format.json { render :show, status: :ok, location: @remote_nafama }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @remote_nafama.errors, status: :unprocessable_entity }
      end
    end
  end


   def delete
      @remote_nafama = RemoteNafama.find(params[:remote_nafama_id])
    end


  # DELETE /remote_nafamas/1
  # DELETE /remote_nafamas/1.json
  def destroy
    @remote_nafama.destroy
    respond_to do |format|
      format.html { redirect_to remote_nafamas_url, notice: 'Remote nafama was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_remote_nafama
      @remote_nafama = RemoteNafama.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def remote_nafama_params
      params.require(:remote_nafama).permit(:amount, :customer_id)
    end
end
