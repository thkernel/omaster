class ImportationsController < ApplicationController
  before_action :authenticate_user!
  layout "dashboard"

  before_action :set_importation, only: [:show, :edit, :update, :destroy]

  # GET /importations
  # GET /importations.json
  def index
    @importations = Importation.all
  end

  def importation_modal
  end

  def importation
    file = params[:file_name]
    puts "FILE: #{file}"

    import_xls(file)
     @importations = Importation.all

  end

  # GET /importations/1
  # GET /importations/1.json
  def show
  end

  # GET /importations/new
  def new
    @importation = Importation.new
  end

  # GET /importations/1/edit
  def edit
  end

  # POST /importations
  # POST /importations.json
  def create
    @importation = Importation.new(importation_params)

    respond_to do |format|
      if @importation.save
        format.html { redirect_to @importation, notice: 'Importation was successfully created.' }
        format.json { render :show, status: :created, location: @importation }
      else
        format.html { render :new }
        format.json { render json: @importation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /importations/1
  # PATCH/PUT /importations/1.json
  def update
    respond_to do |format|
      if @importation.update(importation_params)
        format.html { redirect_to @importation, notice: 'Importation was successfully updated.' }
        format.json { render :show, status: :ok, location: @importation }
      else
        format.html { render :edit }
        format.json { render json: @importation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /importations/1
  # DELETE /importations/1.json
  def destroy
    @importation.destroy
    respond_to do |format|
      format.html { redirect_to importations_url, notice: 'Importation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_importation
      @importation = Importation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def importation_params
      params.require(:importation).permit(:uid, :file_name, :user_id, :status)
    end


    def import_xls(file)

      # Opening file
      creek = Creek::Book.new(file.path)
      puts "File path: #{file.path}"

      # Getting the first sheet
      sheet = creek.sheets[0]
      record_count = 0

      # Loop all sheet rows
      puts "Je compte: #{sheet.rows.count}"
      puts "Feuille: #{sheet}"


      #
      importation = Importation.new
      activities = []

      sheet.rows.each_with_index do |row, index|
        puts "L'index avant condition: #{index}"
      
        

        unless index < 14
          puts "Entrer dans la boucle à l'index: #{index}"
          # The row return a hash, we save all Hash key in a new Array
          cell = row.keys

        
          
          #if row[cell[0]].present?  
           
            activity_numero = row[cell[0]]
            activity_network_nature = row[cell[1]]
            activity_designation = row[cell[2]]
            activity_customer = row[cell[3]]
            activity_pont_head = row[cell[4]]
            activity_debit = row[cell[5]]
            activity_credit = row[cell[6]]

           
            #activity = Activity.new
            activity = {}

            activity[:network_nature] = activity_network_nature
            activity[:designation] = activity_designation
            activity[:customer_number] = activity_customer
            activity[:pont_head] = activity_pont_head
            activity[:debit] = activity_debit
            activity[:credit] = activity_credit

            activities.push(activity)

          #else
            #next
          #end
        end
      end

      # Save
      puts "COLLECTION: #{activities}"

      importation = Importation.new
      importation.user_id = current_user.id
      importation.file_name = file.original_filename
      importation.save

      activities.each do |item|
        puts "ITEM : #{item}"
        activity = Activity.new
        activity.network_nature = item[:network_nature]
        activity.designation = item[:designation]
        activity.customer_number = item[:customer_number]
        activity.pont_head = item[:pont_head]
        activity.debit = item[:debit]
        activity.credit = item[:credit]
        activity.importation_id = importation.id
        activity.save
        puts "ITEM SAVED"
      end

      puts "ALL SAVED"

    end
end
