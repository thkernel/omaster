class ReturnUnitValuesController < ApplicationController
  before_action :set_return_unit_value, only: [:show, :edit, :update, :destroy]

  # GET /return_unit_values
  # GET /return_unit_values.json
  def index
    @return_unit_values = ReturnUnitValue.all
  end

  # GET /return_unit_values/1
  # GET /return_unit_values/1.json
  def show
  end

  # GET /return_unit_values/new
  def new
    @return_unit_value = ReturnUnitValue.new
  end

  # GET /return_unit_values/1/edit
  def edit
  end

  # POST /return_unit_values
  # POST /return_unit_values.json
  def create
    @return_unit_value = ReturnUnitValue.new(return_unit_value_params)

    respond_to do |format|
      if @return_unit_value.save
        format.html { redirect_to @return_unit_value, notice: 'Return unit value was successfully created.' }
        format.json { render :show, status: :created, location: @return_unit_value }
      else
        format.html { render :new }
        format.json { render json: @return_unit_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /return_unit_values/1
  # PATCH/PUT /return_unit_values/1.json
  def update
    respond_to do |format|
      if @return_unit_value.update(return_unit_value_params)
        format.html { redirect_to @return_unit_value, notice: 'Return unit value was successfully updated.' }
        format.json { render :show, status: :ok, location: @return_unit_value }
      else
        format.html { render :edit }
        format.json { render json: @return_unit_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /return_unit_values/1
  # DELETE /return_unit_values/1.json
  def destroy
    @return_unit_value.destroy
    respond_to do |format|
      format.html { redirect_to return_unit_values_url, notice: 'Return unit value was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_return_unit_value
      @return_unit_value = ReturnUnitValue.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def return_unit_value_params
      params.require(:return_unit_value).permit(:reason, :customer_id, :amount, :agent_id, :user_id)
    end
end
