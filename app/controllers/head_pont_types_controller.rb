class HeadPontTypesController < ApplicationController
  before_action :set_head_pont_type, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  layout "dashboard"

  # GET /head_pont_types
  # GET /head_pont_types.json
  def index
    @head_pont_types = HeadPontType.all
  end

  # GET /head_pont_types/1
  # GET /head_pont_types/1.json
  def show
  end

  # GET /head_pont_types/new
  def new
    @head_pont_type = HeadPontType.new
  end

  # GET /head_pont_types/1/edit
  def edit
  end

  # POST /head_pont_types
  # POST /head_pont_types.json
  def create
    @head_pont_type = current_user.head_pont_types.build(head_pont_type_params)

    respond_to do |format|
      if @head_pont_type.save
        format.html { redirect_to @head_pont_type, notice: 'Head pont type was successfully created.' }
        format.json { render :show, status: :created, location: @head_pont_type }
        format.js
      else
        format.html { render :new }
        format.json { render json: @head_pont_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /head_pont_types/1
  # PATCH/PUT /head_pont_types/1.json
  def update
    respond_to do |format|
      if @head_pont_type.update(head_pont_type_params)
        format.html { redirect_to @head_pont_type, notice: 'Head pont type was successfully updated.' }
        format.json { render :show, status: :ok, location: @head_pont_type }
      else
        format.html { render :edit }
        format.json { render json: @head_pont_type.errors, status: :unprocessable_entity }
      end
    end
  end


  def delete
    @head_pont_type = HeadPontType.find(params[:head_pont_type_id])
  end


  # DELETE /head_pont_types/1
  # DELETE /head_pont_types/1.json
  def destroy
    @head_pont_type.destroy
    respond_to do |format|
      format.html { redirect_to head_pont_types_url, notice: 'Head pont type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_head_pont_type
      @head_pont_type = HeadPontType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def head_pont_type_params
      params.require(:head_pont_type).permit(:name, :description, :status)
    end
end
