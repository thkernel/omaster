class ArrivalMailsController < ApplicationController

  before_action :authenticate_user!
  layout "dashboard"


  before_action :set_arrival_mail, only: [:show, :edit, :update, :destroy, :to_archive]

  # GET /arrival_mails
  # GET /arrival_mails.json
  def index
    @arrival_mails = ArrivalMail.where.not(status: "Archived")
  end

  # GET /arrival_mails/1
  # GET /arrival_mails/1.json
  def show
  end

  def get_reference
    data = params[:data]
    
    if data.present?
      register = Register.find(data)
      last_arrival_mail = ArrivalMail.last(1)
      if last_arrival_mail.present?
        puts "ARRIVAL MAIL: #{last_arrival_mail.inspect}"
        @reference = "#{last_arrival_mail[0].id}-#{register.name}"
      else
        @reference = "#{1}-#{register.name}"

      end
    end
  end

  def archive
    @arrival_mail = ArrivalMail.find(params[:arrival_mail_id])
  end

  def to_archive

    respond_to do |format|
      if @arrival_mail.update_column(:status, "Archived")
  
        @arrival_mails = ArrivalMail.where.not(status: "Archived")

        format.html { redirect_to arrival_mails_path, notice: 'Arrival mail was successfully created.' }
        format.json { render :show, status: :created, location: @arrival_mail }
        format.js
      else
        format.html { render :new }
        format.json { render json: @arrival_mail.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def archives
    @arrival_mails = ArrivalMail.where(status: "Archived")
  end

  def bulk_archive_modal
  end

  def bulk_archive
    receipt_date = params[:receipt_date]
    puts "ARRIVAL DATE: #{receipt_date}"
    arrival_mails = ArrivalMail.where(receipt_date: receipt_date)

    respond_to do |format|
      if arrival_mails.present?
        if arrival_mails.update_all(status: "Archived")
    

          format.html { redirect_to arrival_mails_archives_path, notice: 'Arrival mail was successfully created.' }
          format.json { render :show, status: :created, location: @arrival_mail }
          format.js
        end
      else
        format.html { redirect_to arrival_mails_archives_path, notice: 'Arrival mail was successfully created.' }
        format.json { render json: @arrival_mail.errors, status: :unprocessable_entity }
        format.js
      end
    end 
  end
  
  # GET /arrival_mails/new
  def new
    @arrival_mail = ArrivalMail.new
    
    register_type = RegisterType.where("lower(name) = ?",  "Courrier d'arrivée".downcase).take
    @registers = Register.where(["status = ? AND register_type_id = ?", "Open", register_type.id ])
    
    @natures = Nature.all 
    @supports = Support.all
    @binders = Binder.all
    @correspondents = Correspondent.all
  end

  # GET /arrival_mails/1/edit
  def edit
    register_type = RegisterType.find_by(name: "Courrier d'arrivée".upcase)
    @registers = Register.where(["status = ? AND register_type_id = ?", "Open", register_type.id ])
    
    @natures = Nature.all 
    @supports = Support.all
    @binders = Binder.all
    @correspondents = Correspondent.all
  end

  # POST /arrival_mails
  # POST /arrival_mails.json
  def create
    @arrival_mail = current_user.arrival_mails.build(arrival_mail_params)
    @arrival_mail.status = "Enable"
    
    respond_to do |format|
      if @arrival_mail.save
        @arrival_mails = ArrivalMail.where.not(status: "Archived")

        format.html { redirect_to arrival_mails_path, notice: 'Arrival mail was successfully created.' }
        format.json { render :show, status: :created, location: @arrival_mail }
        format.js
      else
        format.html { render :new }
        format.json { render json: @arrival_mail.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /arrival_mails/1
  # PATCH/PUT /arrival_mails/1.json
  def update
    respond_to do |format|
      if @arrival_mail.update(arrival_mail_params)
        @arrival_mails = ArrivalMail.where.not(status: "Archived")

        format.html { redirect_to arrival_mails_path, notice: 'Arrival mail was successfully updated.' }
        format.json { render :show, status: :ok, location: @arrival_mail }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @arrival_mail.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end


  def delete
    @arrival_mail = ArrivalMail.find(params[:arrival_mail_id])
  end



  # DELETE /arrival_mails/1
  # DELETE /arrival_mails/1.json
  def destroy
    @arrival_mail.destroy
    @arrival_mails = ArrivalMail.where.not(status: "Archived")

    respond_to do |format|
      format.html { redirect_to arrival_mails_url, notice: 'Arrival mail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_arrival_mail
      @arrival_mail = ArrivalMail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def arrival_mail_params
      params.require(:arrival_mail).permit(:register_id, :internal_reference, :external_reference, :departure_date, :receipt_date, :linked_to_mail, :reference_linked_mail, :to_answer,  :response_limit_time, :response_date, :support_id, :nature_id, :correspondent_id, :object, :description, :binder_id,   files: [])
    end
end