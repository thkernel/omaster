class SendUnitValuesController < ApplicationController
  before_action :set_send_unit_value, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  layout "dashboard"

  # GET /send_unit_values
  # GET /send_unit_values.json
  def index
    @send_unit_values = SendUnitValue.all
  end

  # GET /send_unit_values/1
  # GET /send_unit_values/1.json
  def show
  end

  # GET /send_unit_values/new
  def new
    @send_unit_value = SendUnitValue.new
    @customers = Customer.all
    @agents = Agent.all
  end

  # GET /send_unit_values/1/edit
  def edit
    @customers = Customer.all
    @agents = Agent.all
  end

  # POST /send_unit_values
  # POST /send_unit_values.json
  def create
    @send_unit_value = current_user.send_unit_values.build(send_unit_value_params)

    respond_to do |format|
      if @send_unit_value.save

        @send_unit_values = SendUnitValue.all


        format.html { redirect_to @send_unit_value, notice: 'Send unit value was successfully created.' }
        format.json { render :show, status: :created, location: @send_unit_value }
        format.js
      else
        format.html { render :new }
        format.json { render json: @send_unit_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /send_unit_values/1
  # PATCH/PUT /send_unit_values/1.json
  def update
    respond_to do |format|
      if @send_unit_value.update(send_unit_value_params)

        @send_unit_values = SendUnitValue.all

        
        format.html { redirect_to @send_unit_value, notice: 'Send unit value was successfully updated.' }
        format.json { render :show, status: :ok, location: @send_unit_value }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @send_unit_value.errors, status: :unprocessable_entity }
      end
    end
  end

  def delete
    @send_unit_value = SendUnitValue.find(params[:send_unit_value_id])
  end


  # DELETE /send_unit_values/1
  # DELETE /send_unit_values/1.json
  def destroy
    @send_unit_value.destroy
    respond_to do |format|
      format.html { redirect_to send_unit_values_url, notice: 'Send unit value was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_send_unit_value
      @send_unit_value = SendUnitValue.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def send_unit_value_params
      params.require(:send_unit_value).permit(:reason, :customer_id, :amount)
    end
end
