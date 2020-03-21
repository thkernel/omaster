class DiffusionsController < ApplicationController
  before_action :authenticate_user!
  layout "dashboard"
  
  before_action :set_diffusion, only: [:show, :edit, :update, :destroy]
  before_action :set_arrival_mail, only: [:index, :new, :edit]

  # GET /diffusions
  # GET /diffusions.json
  def index
    @diffusions = Diffusion.where(arrival_mail_id: @arrival_mail.id)
  end

  # GET /diffusions/1
  # GET /diffusions/1.json
  def show
  end

  # GET /diffusions/new
  def new
    @diffusion = Diffusion.new
    @services = Service.all
    @recipients = Profile.all
    @arrival_mail_id 
  end

  # GET /diffusions/1/edit
  def edit
    @services = Service.all
    @recipients = Profile.all

  end

  # POST /diffusions
  # POST /diffusions.json
  def create

    @diffusion = current_user.diffusions.new(diffusion_params)
    respond_to do |format|
      if @diffusion.save
          @diffusions = Diffusion.where(arrival_mail_id: @diffusion.arrival_mail.id)

        format.html { redirect_to @diffusion, notice: 'Diffusion was successfully created.' }
        format.json { render :show, status: :created, location: @diffusion }
        format.js
      else
        format.html { render :new }
        format.json { render json: @diffusion.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /diffusions/1
  # PATCH/PUT /diffusions/1.json
  def update
    respond_to do |format|
      if @diffusion.update(diffusion_params)
        @diffusions = Diffusion.where(arrival_mail_id: @diffusion.arrival_mail.id)

        format.html { redirect_to @diffusion, notice: 'Diffusion was successfully updated.' }
        format.json { render :show, status: :ok, location: @diffusion }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @diffusion.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end


  def delete
    @diffusion = Diffusion.find(params[:diffusion_id])
  end

  # DELETE /diffusions/1
  # DELETE /diffusions/1.json
  def destroy
    @diffusion.destroy
    @diffusions = Diffusion.where(arrival_mail_id: @diffusion.arrival_mail.id)

    respond_to do |format|
      format.html { redirect_to diffusions_url, notice: 'Diffusion was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_diffusion
      @diffusion = Diffusion.find(params[:id])
    end

    def set_arrival_mail
      @arrival_mail ||= ArrivalMail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def diffusion_params
      params.require(:diffusion).permit(:reference, :service_id, :recipient, :arrival_mail_id)
    end
end
