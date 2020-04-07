class RemoteUnitValuesController < ApplicationController

  before_action :authenticate_user!
  layout "dashboard"


  before_action :set_remote_unit_value, only: [:show, :edit, :update, :destroy]

  # GET /remote_uvs
  # GET /remote_uvs.json
  def index
    @remote_unit_values = RemoteUnitValue.all
  end

  # GET /remote_uvs/1
  # GET /remote_uvs/1.json
  def show
  end

  # GET /remote_uvs/new
  def new
    @shops = Shop.all
    @remote_unit_value = RemoteUnitValue.new
  end

  # GET /remote_uvs/1/edit
  def edit
    @shops = Shop.all
  end

  # POST /remote_uvs
  # POST /remote_uvs.json
  def create
    @remote_unit_value = current_user.remote_unit_values.build(remote_unit_value_params)

    respond_to do |format|
      if @remote_unit_value.save

        @remote_unit_values = RemoteUnitValue.all

        format.html { redirect_to @remote_unit_value, notice: 'Remote uv was successfully created.' }
        format.json { render :show, status: :created, location: @remote_unit_value }
        format.js
      else
        format.html { render :new }
        format.json { render json: @remote_unit_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /remote_uvs/1
  # PATCH/PUT /remote_uvs/1.json
  def update
    respond_to do |format|
      if @remote_unit_value.update(remote_unit_value_params)
        @remote_unit_values = RemoteUnitValue.all

        format.html { redirect_to @remote_unit_value, notice: 'Remote uv was successfully updated.' }
        format.json { render :show, status: :ok, location: @remote_unit_value }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @remote_unit_value.errors, status: :unprocessable_entity }
      end
    end
  end

   def delete
      @remote_unit_value = RemoteUnitValue.find(params[:remote_unit_value_id])
    end

  # DELETE /remote_uvs/1
  # DELETE /remote_uvs/1.json
  def destroy
    @remote_unit_value.destroy

    @remote_unit_values = RemoteUnitValue.all


    respond_to do |format|
      format.html { redirect_to remote_unit_values_url, notice: 'Remote uv was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_remote_unit_value
      @remote_unit_value = RemoteUnitValue.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def remote_unit_value_params
      params.require(:remote_unit_value).permit(:amount, :sender, :receiver)
    end
end
