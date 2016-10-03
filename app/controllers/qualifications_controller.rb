class QualificationsController < ApplicationController

  #layout
  layout 'candidate/layout'

  # helpers
  include QualificationsHelper

  # filter/callbacks
  before_action :set_entity

  # GET /candidates/:candidate_id/qualifications
  # GET /candidates/:candidate_id/qualifications.json
  # GET /companies/:company_id/jobs/:job_id/qualifications
  # GET /companies/:company_id/jobs/:job_id/qualifications.json
  def index
    @qualifications = @entity.qualifications
  end

  # GET /candidates/:candidate_id/qualifications/1/edit
  # GET /companies/:company_id/jobs/:job_id/qualifications/1/edit
  def edit
    if @entity.class == Company::JobOpportunity
      @entity_qualifications = @entity.qualifications
      @new_entity_qualification = Qualification.new
      render :edit_job
    elsif @entity.class == Candidate
      @entity_institutes_with_qualifications = @entity.get_institutes_with_qualifications
      @new_entity_institute = Institute.new
      @new_entity_qualification = Qualification.new
      render :edit_candidate
    end
  end

  # POST /candidates/:candidate_id/qualifications
  # POST /candidates/:candidate_id/qualifications.json
  # POST /companies/:company_id/jobs/:job_id/qualifications
  # POST /companies/:company_id/jobs/:job_id/qualifications.json
  def create
    if @entity.class == Candidate
      @institute = Institute.find_or_create_by(institute_params)
      @qualification = Qualification.find_or_create_by(qualification_params)
      @entity.add_institute_with_qualification(@institute,@qualification)
      redirect_to edit_candidate_qualification_index_path(candidate_id:params[:candidate_id])
    elsif @entity.class == Comapany::JobOpportunity
    end
  end

  # PATCH/PUT /candidates/:candidate_id/qualifications/1
  # PATCH/PUT /candidates/:candidate_id/qualifications/1.json
  # PATCH/PUT /companies/:company_id/jobs/:job_id/qualifications/1
  # PATCH/PUT /companies/:company_id/jobs/:job_id/qualifications/1.json
  def update
    if @entity.class == Candidate
      @institute = Institute.find_or_create_by(institute_params)
      @qualification = Qualification.find_or_create_by(qualification_params)
      @entity.update_institute_with_qualification(@institute,@qualification,params[:candidate_id],params[:id])
      redirect_to edit_candidate_qualification_index_path(candidate_id:params[:candidate_id])
    elsif @entity.class == Company::JobOpportunity 
    end

  end

  # DELETE /candidates/:candidate_id/qualifications/1
  # DELETE /candidates/:candidate_id/qualifications/1.json
  # DELETE /companies/:company_id/jobs/:job_id/qualifications/1
  # DELETE /companies/:company_id/jobs/:job_id/qualifications/1.json
  def destroy
    if @entity.class == Candidate
      cqa = CandidateQualificationAssignment.find_by(candidate_id: params[:candidate_id],qualification_assignment_id:params[:id])
      if cqa.destroy
        redirect_to edit_candidate_qualification_index_path(candidate_id:params[:candidate_id]) 
      end
    elsif @entity.class == Company::JobOpportunity
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

    def institute_params
      params.require(:institute).permit(:university,:campus)
    end
end
