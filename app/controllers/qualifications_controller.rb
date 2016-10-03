class QualificationsController < ApplicationController

  # helpers
  include QualificationsHelper

  # filter/callbacks
  before_action :set_entity
  before_action :set_qualification, only: [:show, :edit, :update, :destroy]

  # GET /candidates/:candidate_id/qualifications
  # GET /candidates/:candidate_id/qualifications.json
  # GET /companies/:company_id/jobs/:job_id/qualifications
  # GET /companies/:company_id/jobs/:job_id/qualifications.json
  def index
    @qualifications = @entity.qualifications
  end

  # GET /candidates/:candidate_id/qualifications/1
  # GET /candidates/:candidate_id/qualifications/1.json
  # GET /companies/:company_id/jobs/:job_id/qualifications/1
  # GET /companies/:company_id/jobs/:job_id/qualifications/1.json
  def show
  end

  # GET /candidates/:candidate_id/qualifications/new
  # GET /companies/:company_id/jobs/:job_id/qualifications/new
  def new
    @qualification = Qualification.new
  end

  # GET /candidates/:candidate_id/qualifications/1/edit
  # GET /companies/:company_id/jobs/:job_id/qualifications/1/edit
  def edit
  end

  # POST /candidates/:candidate_id/qualifications
  # POST /candidates/:candidate_id/qualifications.json
  # POST /companies/:company_id/jobs/:job_id/qualifications
  # POST /companies/:company_id/jobs/:job_id/qualifications.json
  def create
    @qualification = Qualification.new(qualification_params)

    respond_to do |format|
      if @qualification.save
        @entity.qualifications << @qualification
        flash[:notice] = 'Qualification was successfully created.'
        format.html { redirect_to self.send(qualification_path,qualification_path_params(@qualification)) }
        format.json { render :show, status: :created, location: @qualification }
      else
        format.html { render :new }
        format.json { render json: @qualification.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /candidates/:candidate_id/qualifications/1
  # PATCH/PUT /candidates/:candidate_id/qualifications/1.json
  # PATCH/PUT /companies/:company_id/jobs/:job_id/qualifications/1
  # PATCH/PUT /companies/:company_id/jobs/:job_id/qualifications/1.json
  def update
    respond_to do |format|
      if @qualification.update(qualification_params)
        flash[:notice] = 'Qualification was successfully updated.'
        format.html { redirect_to self.send(qualification_path,qualification_path_params(@qualification)) }
        format.json { render :show, status: :ok, location: @qualification }
      else
        format.html { render :edit }
        format.json { render json: @qualification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /candidates/:candidate_id/qualifications/1
  # DELETE /candidates/:candidate_id/qualifications/1.json
  # DELETE /companies/:company_id/jobs/:job_id/qualifications/1
  # DELETE /companies/:company_id/jobs/:job_id/qualifications/1.json
  def destroy
    @entity.qualifications.destroy(@qualification)
    flash[:notice] = 'Qualification was successfully destroyed.'
    respond_to do |format|
      format.html { redirect_to self.send(qualification_path('index')) }
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
