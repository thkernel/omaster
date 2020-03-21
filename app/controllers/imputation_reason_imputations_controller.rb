class ImputationReasonImputationsController < ApplicationController
  before_action :set_imputation_reason_imputation, only: [:show, :edit, :update, :destroy]

  # GET /imputation_reason_imputations
  # GET /imputation_reason_imputations.json
  def index
    @imputation_reason_imputations = ImputationReasonImputation.all
  end

  # GET /imputation_reason_imputations/1
  # GET /imputation_reason_imputations/1.json
  def show
  end

  # GET /imputation_reason_imputations/new
  def new
    @imputation_reason_imputation = ImputationReasonImputation.new
  end

  # GET /imputation_reason_imputations/1/edit
  def edit
  end

  # POST /imputation_reason_imputations
  # POST /imputation_reason_imputations.json
  def create
    @imputation_reason_imputation = ImputationReasonImputation.new(imputation_reason_imputation_params)

    respond_to do |format|
      if @imputation_reason_imputation.save
        format.html { redirect_to @imputation_reason_imputation, notice: 'Imputation reason imputation was successfully created.' }
        format.json { render :show, status: :created, location: @imputation_reason_imputation }
      else
        format.html { render :new }
        format.json { render json: @imputation_reason_imputation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /imputation_reason_imputations/1
  # PATCH/PUT /imputation_reason_imputations/1.json
  def update
    respond_to do |format|
      if @imputation_reason_imputation.update(imputation_reason_imputation_params)
        format.html { redirect_to @imputation_reason_imputation, notice: 'Imputation reason imputation was successfully updated.' }
        format.json { render :show, status: :ok, location: @imputation_reason_imputation }
      else
        format.html { render :edit }
        format.json { render json: @imputation_reason_imputation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /imputation_reason_imputations/1
  # DELETE /imputation_reason_imputations/1.json
  def destroy
    @imputation_reason_imputation.destroy
    respond_to do |format|
      format.html { redirect_to imputation_reason_imputations_url, notice: 'Imputation reason imputation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_imputation_reason_imputation
      @imputation_reason_imputation = ImputationReasonImputation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def imputation_reason_imputation_params
      params.require(:imputation_reason_imputation).permit(:imputation_id, :imputation_reason_id)
    end
end
