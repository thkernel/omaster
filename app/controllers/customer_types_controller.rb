class CustomerTypesController < ApplicationController
  before_action :set_customer_type, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  layout "dashboard"

  # GET /customer_types
  # GET /customer_types.json
  def index
    @customer_types = CustomerType.all
  end

  # GET /customer_types/1
  # GET /customer_types/1.json
  def show
  end

  # GET /customer_types/new
  def new
    @customer_type = CustomerType.new
  end

  # GET /customer_types/1/edit
  def edit
  end

  # POST /customer_types
  # POST /customer_types.json
  def create
    @customer_type = current_user.customer_types.build(customer_type_params)

    respond_to do |format|
      if @customer_type.save
        format.html { redirect_to @customer_type, notice: 'Customer type was successfully created.' }
        format.json { render :show, status: :created, location: @customer_type }
        format.js
      else
        format.html { render :new }
        format.json { render json: @customer_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customer_types/1
  # PATCH/PUT /customer_types/1.json
  def update
    respond_to do |format|
      if @customer_type.update(customer_type_params)
        format.html { redirect_to @customer_type, notice: 'Customer type was successfully updated.' }
        format.json { render :show, status: :ok, location: @customer_type }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @customer_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def delete
    @customer_type = CustomerType.find(params[:customer_type_id])
  end

  # DELETE /customer_types/1
  # DELETE /customer_types/1.json
  def destroy
    @customer_type.destroy
    respond_to do |format|
      format.html { redirect_to customer_types_url, notice: 'Customer type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer_type
      @customer_type = CustomerType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def customer_type_params
      params.require(:customer_type).permit(:name, :description, :status)
    end
end
