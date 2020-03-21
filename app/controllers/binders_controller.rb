class BindersController < ApplicationController
# Include shared utils.
include SharedUtils::Folder
include  FoldersHelper


  before_action :authenticate_user!
  layout "dashboard"


  before_action :set_binder, only: [:show, :edit, :update, :destroy]

  # GET /binders
  # GET /binders.json
  def index
    @binders = Binder.all
  end

  # GET /binders/1
  # GET /binders/1.json
  def show
  end

  # GET /binders/new
  def new
    @binder = Binder.new
    @folders = Folder.all
  end

  # GET /binders/1/edit
  def edit
    @folders = Folder.all

  end

  # POST /binders
  # POST /binders.json
  def create
    @binder = current_user.binders.build(binder_params)

    respond_to do |format|
      if @binder.save
        create_folder( OutinStorage.configuration.path + Apartment::Tenant.current + "/" + folder_name(@binder.folder_id).downcase + "/" + @binder.name.downcase)

        @binders = Binder.all

        format.html { redirect_to @binder, notice: 'Binder was successfully created.' }
        format.json { render :show, status: :created, location: @binder }
        format.js
      else
        format.html { render :new }
        format.json { render json: @binder.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /binders/1
  # PATCH/PUT /binders/1.json
  def update
    respond_to do |format|
      if @binder.update(binder_params)
        @binders = Binder.all
        format.html { redirect_to @binder, notice: 'Binder was successfully updated.' }
        format.json { render :show, status: :ok, location: @binder }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @binder.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end


  def delete
    @binder = Binder.find(params[:binder_id])
  end


  # DELETE /binders/1
  # DELETE /binders/1.json
  def destroy
    @binder.destroy
    @binders = Binder.all

    respond_to do |format|
      format.html { redirect_to binders_url, notice: 'Binder was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_binder
      @binder = Binder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def binder_params
      params.require(:binder).permit(:name, :description, :folder_id)
    end
end
