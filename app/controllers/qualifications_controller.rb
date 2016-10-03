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
    if @entity.class == Company::JobOpportunity
      @qualifications = @entity.qualifications
    else @entity.class == Candidate
      @entity_institutes_with_qualifications = @entity.get_institutes_with_qualifications
    end
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
<<<<<<< HEAD
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
=======
    if @entity.class == Candidate
      @institute = Institute.find_or_create_by(institute_params)
      @qualification = Qualification.find_or_create_by(qualification_params)
      if @institute.id && @qualification.id && @entity.add_institute_with_qualification(@institute,@qualification)
        flash[:success] = 'Qualification was successfully created'
        redirect_to edit_candidate_qualification_index_path(candidate_id:params[:candidate_id])
      else 
        flash[:failure] = 'Qualification creation unsuccessful'
        redirect_to edit_candidate_qualification_index_path(candidate_id:params[:candidate_id])
>>>>>>> feature/candidate-controller
      end
    elsif @entity.class == Comapany::JobOpportunity
    end
  end

  # PATCH/PUT /candidates/:candidate_id/qualifications/1
  # PATCH/PUT /candidates/:candidate_id/qualifications/1.json
  # PATCH/PUT /companies/:company_id/jobs/:job_id/qualifications/1
  # PATCH/PUT /companies/:company_id/jobs/:job_id/qualifications/1.json
  def update
<<<<<<< HEAD
    respond_to do |format|
      if @qualification.update(qualification_params)
        flash[:notice] = 'Qualification was successfully updated.'
        format.html { redirect_to self.send(qualification_path,qualification_path_params(@qualification)) }
        format.json { render :show, status: :ok, location: @qualification }
      else
        format.html { render :edit }
        format.json { render json: @qualification.errors, status: :unprocessable_entity }
=======
    if @entity.class == Candidate
      @institute = Institute.find_or_create_by(institute_params)
      @qualification = Qualification.find_or_create_by(qualification_params)
      if @institute.id && @qualification.id && @entity.update_institute_with_qualification(@institute,@qualification,params[:candidate_id],params[:id])
        flash[:success] = 'Qualification successfully updated'
        redirect_to edit_candidate_qualification_index_path(candidate_id:params[:candidate_id])
      else 
        flash[:failure] = 'Qualification updation unsuccessful'
        redirect_to edit_candidate_qualification_index_path(candidate_id:params[:candidate_id])
>>>>>>> feature/candidate-controller
      end
    elsif @entity.class == Company::JobOpportunity 
    end

  end

  # DELETE /candidates/:candidate_id/qualifications/1
  # DELETE /candidates/:candidate_id/qualifications/1.json
  # DELETE /companies/:company_id/jobs/:job_id/qualifications/1
  # DELETE /companies/:company_id/jobs/:job_id/qualifications/1.json
  def destroy
<<<<<<< HEAD
    @entity.qualifications.destroy(@qualification)
    flash[:notice] = 'Qualification was successfully destroyed.'
    respond_to do |format|
      format.html { redirect_to self.send(qualification_path('index')) }
      format.json { head :no_content }
=======
    if @entity.class == Candidate
      cqa = CandidateQualificationAssignment.find_by(candidate_id: params[:candidate_id],qualification_assignment_id:params[:id])
      if cqa.destroy
        flash[:success] = 'Qualification successfully deleted'
        redirect_to edit_candidate_qualification_index_path(candidate_id:params[:candidate_id]) 
      end
    elsif @entity.class == Company::JobOpportunity
>>>>>>> feature/candidate-controller
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
