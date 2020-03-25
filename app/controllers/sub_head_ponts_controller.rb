class SubHeadPontsController < ApplicationController
  before_action :set_sub_head_pont, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  layout "dashboard"

  # GET /sub_head_ponts
  # GET /sub_head_ponts.json
  def index
    @sub_head_ponts = SubHeadPont.all
  end

  # GET /sub_head_ponts/1
  # GET /sub_head_ponts/1.json
  def show
  end

  # GET /sub_head_ponts/new
  def new
    @sub_head_pont = SubHeadPont.new
    @sub_head_pont_types = SubHeadPontType.all
  end

  # GET /sub_head_ponts/1/edit
  def edit
  end

  # POST /sub_head_ponts
  # POST /sub_head_ponts.json
  def create
    @sub_head_pont = current_user.sub_head_ponts.build(sub_head_pont_params)

    respond_to do |format|
      if @sub_head_pont.save
        format.html { redirect_to @sub_head_pont, notice: 'Sub head pont was successfully created.' }
        format.json { render :show, status: :created, location: @sub_head_pont }
        format.js
      else
        format.html { render :new }
        format.json { render json: @sub_head_pont.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sub_head_ponts/1
  # PATCH/PUT /sub_head_ponts/1.json
  def update
    respond_to do |format|
      if @sub_head_pont.update(sub_head_pont_params)
        format.html { redirect_to @sub_head_pont, notice: 'Sub head pont was successfully updated.' }
        format.json { render :show, status: :ok, location: @sub_head_pont }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @sub_head_pont.errors, status: :unprocessable_entity }
      end
    end
  end

  def delete
    @sub_head_pont = SubHeadPont.find(params[:sub_head_pont_id])
  end

  # DELETE /sub_head_ponts/1
  # DELETE /sub_head_ponts/1.json
  def destroy
    @sub_head_pont.destroy
    respond_to do |format|
      format.html { redirect_to sub_head_ponts_url, notice: 'Sub head pont was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sub_head_pont
      @sub_head_pont = SubHeadPont.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sub_head_pont_params
      params.require(:sub_head_pont).permit(:sub_head_pont_type_id, :number, :description, :status, :user_id)
    end
end
