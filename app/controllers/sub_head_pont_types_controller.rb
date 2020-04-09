class SubHeadPontTypesController < ApplicationController
  before_action :set_sub_head_pont_type, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  layout "dashboard"

  # GET /sub_head_pont_types
  # GET /sub_head_pont_types.json
  def index
    @sub_head_pont_types = SubHeadPontType.all
  end

  # GET /sub_head_pont_types/1
  # GET /sub_head_pont_types/1.json
  def show
  end

  # GET /sub_head_pont_types/new
  def new
    @sub_head_pont_type = SubHeadPontType.new
  end

  # GET /sub_head_pont_types/1/edit
  def edit
  end

  # POST /sub_head_pont_types
  # POST /sub_head_pont_types.json
  def create
    @sub_head_pont_type = current_user.sub_head_pont_types.build(sub_head_pont_type_params)

    respond_to do |format|
      if @sub_head_pont_type.save
        @sub_head_pont_types = SubHeadPontType.all
        format.html { redirect_to @sub_head_pont_type, notice: 'Sub head pont type was successfully created.' }
        format.json { render :show, status: :created, location: @sub_head_pont_type }
        format.js
      else
        format.html { render :new }
        format.json { render json: @sub_head_pont_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sub_head_pont_types/1
  # PATCH/PUT /sub_head_pont_types/1.json
  def update
    respond_to do |format|
      if @sub_head_pont_type.update(sub_head_pont_type_params)
        @sub_head_pont_types = SubHeadPontType.all
        format.html { redirect_to @sub_head_pont_type, notice: 'Sub head pont type was successfully updated.' }
        format.json { render :show, status: :ok, location: @sub_head_pont_type }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @sub_head_pont_type.errors, status: :unprocessable_entity }
      end
    end
  end


  def delete
    @sub_head_pont_type = SubHeadPontType.find(params[:sub_head_pont_type_id])
  end


  # DELETE /sub_head_pont_types/1
  # DELETE /sub_head_pont_types/1.json
  def destroy
    @sub_head_pont_type.destroy
    respond_to do |format|
      format.html { redirect_to sub_head_pont_types_url, notice: 'Sub head pont type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sub_head_pont_type
      @sub_head_pont_type = SubHeadPontType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sub_head_pont_type_params
      params.require(:sub_head_pont_type).permit(:name, :description, :status)
    end
end
