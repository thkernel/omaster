class ImputationsController < ApplicationController
 
  before_action :authenticate_user!
  layout "dashboard"

  before_action :set_imputation, only: [:show, :edit, :update, :destroy]
  before_action :set_arrival_mail, only: [:index, :new]
  #before_action :get_arrival_mail, only: [:create]

  # GET /imputations
  # GET /imputations.json
  def index
    @imputations = Imputation.where(arrival_mail_id: @arrival_mail.id)
  end

  # GET /imputations/1
  # GET /imputations/1.json
  def show
  end

  def get_profiles
    
    if params[:data].present?
      service = Service.find(params[:data])
      puts "SERVICE: #{service.inspect}"
      @recipients = Profile.where(service_id: service.id)

      puts "RECIPIENT: #{@recipients}"
    end
  end
  # GET /imputations/new
  def new
   
    @services = Service.all
    @recipients = Profile.all
    puts "RECIPIENTS ON NEW: #{@recipients}"
    @imputation_reasons = ImputationReason.all

    @imputation = Imputation.new

  end

  # GET /imputations/1/edit
  def edit
    @services = Service.all
    @recipients = Profile.all
    
    @imputation_reasons = ImputationReason.all
    imputation_items = @imputation.imputation_items 

    @selected_imputation_reasons = imputation_items   unless imputation_items.blank?
  end

  # POST /imputations
  # POST /imputations.json
  def create

    @imputation = current_user.imputations.build(imputation_params)
    @imputation.arrival_mail_id = @@arrival_mail.id

    params[:imputation_reasons][:id].each do |imputation_reason|
      unless imputation_reason.empty?
        @imputation.imputation_items.build(imputation_reason_id: imputation_reason)
      end
    end

    respond_to do |format|
      if @imputation.save
        @imputations = Imputation.where(arrival_mail_id: @imputation.arrival_mail_id)

        format.html { redirect_to @imputation, notice: 'Imputation was successfully created.' }
        format.json { render :show, status: :created, location: @imputation }
        format.js
      else
        format.html { render :new }
        format.json { render json: @imputation.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /imputations/1
  # PATCH/PUT /imputations/1.json
  def update

    @imputation.imputation_items.delete_all

    params[:imputation_reasons][:id].each do |imputation_reason|
      unless imputation_reason.empty?
        @imputation.imputation_items.build(imputation_reason_id: imputation_reason)
      end
    end

    respond_to do |format|
      if @imputation.update(imputation_params)
        @imputations = Imputation.where(arrival_mail_id: @imputation.arrival_mail_id)
        format.html { redirect_to @imputation, notice: 'Imputation was successfully updated.' }
        format.json { render :show, status: :ok, location: @imputation }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @imputation.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end


  def delete
    @imputation = Imputation.find(params[:imputation_id])
  end


  # DELETE /imputations/1
  # DELETE /imputations/1.json
  def destroy
    @imputation.destroy
    respond_to do |format|
      format.html { redirect_to arrival_mail_imputations_path(@imputation.arrival_mail_id), notice: 'Imputation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_imputation
      @imputation = Imputation.find(params[:id])
    end

    def set_arrival_mail
      @arrival_mail ||= ArrivalMail.find(params[:id])
      @@arrival_mail = @arrival_mail
    end

    

    # Never trust parameters from the scary internet, only allow the white list through.
    def imputation_params
      params.require(:imputation).permit(:service_id, :recipient_id)
    end
end
