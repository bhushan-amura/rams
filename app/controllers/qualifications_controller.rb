class QualificationsController < ApplicationController

  # helpers
  include QualificationsHelper

  # filter/callbacks
  before_action :set_entity
  before_action :set_qualification, only: [:show, :edit, :update, :destroy]

  # GET /qualifications
  # GET /qualifications.json
  def index
    @qualifications = @entity.qualifications
  end

  # GET /qualifications/1
  # GET /qualifications/1.json
  def show
  end

  # GET /qualifications/new
  def new
    @qualification = Qualification.new
  end

  # GET /qualifications/1/edit
  def edit
  end

  # POST /qualifications
  # POST /qualifications.json
  def create
    @qualification = Qualification.new(qualification_params)

    respond_to do |format|
      if @qualification.save
        @entity.qualifications << @qualification
        format.html { redirect_to self.send(qualification_path,qualification_path_params(@qualification)), notice: 'Qualification was successfully created.' }
        format.json { render :show, status: :created, location: @qualification }
      else
        format.html { render :new }
        format.json { render json: @qualification.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /qualifications/1
  # PATCH/PUT /qualifications/1.json
  def update
    respond_to do |format|
      if @qualification.update(qualification_params)
        format.html { redirect_to self.send(qualification_path,qualification_path_params(@qualification)), notice: 'Qualification was successfully updated.' }
        format.json { render :show, status: :ok, location: @qualification }
      else
        format.html { render :edit }
        format.json { render json: @qualification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /qualifications/1
  # DELETE /qualifications/1.json
  def destroy
    @entity.qualifications.destroy(@qualification)
    respond_to do |format|
      format.html { redirect_to self.send(qualification_path('index')), notice: 'Qualification was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entity
      if params.has_key?(:candidate_id)
        @entity = Candidate.find(params[:candidate_id])
      elsif params.has_key?(:job_id)
        @entity = Company::JobOpportunity.find(params[:job_id])
      end
    end

    def set_qualification
      @qualification = @entity.qualifications.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def qualification_params
      params.require(:qualification).permit(:course,:domain)
    end
end
