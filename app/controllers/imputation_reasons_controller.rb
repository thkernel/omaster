class ImputationReasonsController < ApplicationController
  before_action :authenticate_user!
  layout "dashboard"

  before_action :set_imputation_reason, only: [:show, :edit, :update, :destroy]

  # GET /imputation_reasons
  # GET /imputation_reasons.json
  def index
    @imputation_reasons = ImputationReason.all
  end

  # GET /imputation_reasons/1
  # GET /imputation_reasons/1.json
  def show
  end

  # GET /imputation_reasons/new
  def new
    @imputation_reason = ImputationReason.new
  end

  # GET /imputation_reasons/1/edit
  def edit
  end

  # POST /imputation_reasons
  # POST /imputation_reasons.json
  def create
    @imputation_reason = current_user.imputation_reasons.build(imputation_reason_params)

    respond_to do |format|
      if @imputation_reason.save
        @imputation_reasons = ImputationReason.all

        format.html { redirect_to @imputation_reason, notice: 'Imputation reason was successfully created.' }
        format.json { render :show, status: :created, location: @imputation_reason }
        format.js
      else
        format.html { render :new }
        format.json { render json: @imputation_reason.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /imputation_reasons/1
  # PATCH/PUT /imputation_reasons/1.json
  def update
    respond_to do |format|
      if @imputation_reason.update(imputation_reason_params)
        @imputation_reasons = ImputationReason.all

        format.html { redirect_to @imputation_reason, notice: 'Imputation reason was successfully updated.' }
        format.json { render :show, status: :ok, location: @imputation_reason }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @imputation_reason.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end


  def delete
    @imputation_reason = ImputationReason.find(params[:imputation_reason_id])
  end

  # DELETE /imputation_reasons/1
  # DELETE /imputation_reasons/1.json
  def destroy
    @imputation_reason.destroy
    @imputation_reasons = ImputationReason.all

    respond_to do |format|
      format.html { redirect_to imputation_reasons_url, notice: 'Imputation reason was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_imputation_reason
      @imputation_reason = ImputationReason.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def imputation_reason_params
      params.require(:imputation_reason).permit(:name, :description)
    end
end
