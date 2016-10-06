class Company::JobOpportunitiesController < ApplicationController

  load_and_authorize_resource :company
  load_and_authorize_resource :job_opportunity, :through => :company, :param_method => "company_job_opportunity_params"
  #layout
  # layout 'company'

  # callbacks
  before_action :set_company
  before_action :set_qualifications
  before_action :set_skills
  before_action :set_company_job_opportunity, only: [:show, :edit, :update, :select_candidates,:destroy,:send_mail_to_shortlisted_candidates]
  before_action :get_candidates, only: [:show, :edit, :update]
  before_action :selected_candidates, only: [:show]

  # helpers
  include Company::JobOpportunitiesHelper

  # GET /company/job_opportunities
  # GET /company/job_opportunities.json
  def index
    redirect_to home_company_path(@company)
    # @company_job_opportunities = @company.job_opportunities
  end

  # GET /company/job_opportunities/1
  # GET /company/job_opportunities/1.json
  def show
  end

  # GET /company/job_opportunities/new
  def new
    @company_job_opportunity = Company::JobOpportunity.new
  end

  # GET /company/job_opportunities/1/edit
  def edit
  end

  # POST /company/job_opportunities
  # POST /company/job_opportunities.json
  def create
    @company_job_opportunity = @company.job_opportunities.build(company_job_opportunity_params)

    respond_to do |format|
      if @company_job_opportunity.save
        flash[:notice] = 'Job opportunity was successfully created.'
        format.html { redirect_to home_company_path(@company) }
        format.json { render :show, status: :created, location: @company_job_opportunity }
      else
        format.html { render :new }
        format.json { render json: @company_job_opportunity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /company/job_opportunities/1
  # PATCH/PUT /company/job_opportunities/1.json
  def update
    respond_to do |format|
      if @company_job_opportunity.update(company_job_opportunity_params)
        flash[:notice] = 'Job opportunity was successfully updated.'
        format.html { redirect_to  home_company_path(@company) }
        format.json { render :show, status: :ok, location: @company_job_opportunity }
      else
        format.html { render :edit }
        format.json { render json: @company_job_opportunity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /company/job_opportunities/1
  # DELETE /company/job_opportunities/1.json
  def destroy
    @company_job_opportunity.destroy
    flash[:notice] = 'Job opportunity was successfully destroyed.'
    respond_to do |format|
      format.html { redirect_to home_company_path(@company) }
      format.json { head :no_content }
    end
  end

  def select_candidates
    @company_job_opportunity.candidates << Candidate.find(params[:shortlist][:candidate_ids].reverse.drop(1))
    redirect_to company_job_path(company_id:params[:company_id],id: params[:job_id])
  end

  def send_mail_to_shortlisted_candidates
    byebug
    if UserNotifier.send_shortlist_mail_to(@company_job_opportunity.get_candidates_as_users,@company_job_opportunity).deliver
      flash[:success] = 'Messages sent successfully' 
      redirect_to :back
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company_job_opportunity
      @company_job_opportunity = @company.job_opportunities.find(params[:id]||params[:job_id])
    end

    def set_company
      @company = Company.find(params[:company_id])
    end

    def set_qualifications
      @qualifications = Qualification.all
    end

    def set_skills
      @skills = Skill.all
    end

    def get_candidates
      @shortlisted_candidates = @company_job_opportunity.shortlist_candidates
    end

    def selected_candidates
      @selected_candidates = @company_job_opportunity.candidates
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_job_opportunity_params
       params.require(:company_job_opportunity).permit(:id, :title, :shift, :description, :number_of_positions, :company_id, :status, :ctc, :experience, qualifications_attributes: [:id, :course, :domain, :_destroy], skills_attributes: [:id, :name, :_destroy])
    end
end
