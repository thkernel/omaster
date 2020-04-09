class HeadPontsController < ApplicationController
  before_action :set_head_pont, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  layout "dashboard"

  # GET /head_ponts
  # GET /head_ponts.json
  def index
    @head_ponts = HeadPont.all
  end

  # GET /head_ponts/1
  # GET /head_ponts/1.json
  def show
  end

  # GET /head_ponts/new
  def new
    @head_pont = HeadPont.new
    @head_pont_types = HeadPontType.all
  end

  # GET /head_ponts/1/edit
  def edit
    @head_pont_types = HeadPontType.all
  end

  # POST /head_ponts
  # POST /head_ponts.json
  def create
    @head_pont = current_user.head_ponts.build(head_pont_params)

    respond_to do |format|
      if @head_pont.save
        @head_ponts = HeadPont.all
        format.html { redirect_to @head_pont, notice: 'Head pont was successfully created.' }
        format.json { render :show, status: :created, location: @head_pont }
        format.js
      else
        format.html { render :new }
        format.json { render json: @head_pont.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /head_ponts/1
  # PATCH/PUT /head_ponts/1.json
  def update
    respond_to do |format|
      if @head_pont.update(head_pont_params)
        @head_ponts = HeadPont.all
        format.html { redirect_to @head_pont, notice: 'Head pont was successfully updated.' }
        format.json { render :show, status: :ok, location: @head_pont }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @head_pont.errors, status: :unprocessable_entity }
      end
    end
  end

  def delete
    @head_pont = HeadPont.find(params[:head_pont_id])
  end


  # DELETE /head_ponts/1
  # DELETE /head_ponts/1.json
  def destroy
    @head_pont.destroy
    respond_to do |format|
      format.html { redirect_to head_ponts_url, notice: 'Head pont was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_head_pont
      @head_pont = HeadPont.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def head_pont_params
      params.require(:head_pont).permit(:head_pont_type_id, :number, :status, :user_id)
    end
end
