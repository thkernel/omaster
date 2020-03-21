class RegistersController < ApplicationController
  before_action :authenticate_user!
  layout "dashboard"
  before_action :set_register, only: [:show, :edit, :update, :destroy]

  # GET /registers
  # GET /registers.json
  def index
    @registers = Register.all
  end

  # GET /registers/1
  # GET /registers/1.json
  def show
  end

  # GET /registers/new
  def new
    @register = Register.new
    @register_types = RegisterType.all
  end

  # GET /registers/1/edit
  def edit
    @register_types = RegisterType.all

  end

  # POST /registers
  # POST /registers.json
  def create
    @register = current_user.registers.build(register_params)
    
    # Set all olders registers status to "close"
    arrival_register = RegisterType.find_by(name: "Courrier d'arrivée".upcase)
    departure_register = RegisterType.find_by(name: "Courrier départ".upcase)

    if @register.register_type_id == arrival_register.id
    
      Register.where(register_type_id: arrival_register.id).update_all(status: "Close")
    elsif @register.register_type_id == departure_register.id
      Register.where(register_type_id: departure_register.id).update_all(status: "Close")
    end
      @register.status = "Open"

    respond_to do |format|
      if @register.save
        @registers = Register.all

        format.html { redirect_to @register, notice: 'Register was successfully created.' }
        format.json { render :show, status: :created, location: @register }
        format.js
      else
        format.html { render :new }
        format.json { render json: @register.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /registers/1
  # PATCH/PUT /registers/1.json
  def update
    respond_to do |format|
      if @register.update(register_params)
        @registers = Register.all

        format.html { redirect_to @register, notice: 'Register was successfully updated.' }
        format.json { render :show, status: :ok, location: @register }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @register.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end


  def delete
    @register = Register.find(params[:register_id])
  end

  # DELETE /registers/1
  # DELETE /registers/1.json
  def destroy
    @register.destroy
    @registers = Register.all

    respond_to do |format|
      format.html { redirect_to registers_url, notice: 'Register was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_register
      @register = Register.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def register_params
      params.require(:register).permit(:reference, :start_date, :end_date, :name, :register_type_id)
    end
end
