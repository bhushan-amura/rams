class Company::JobOpportunitiesController < ApplicationController

  load_and_authorize_resource :company
  load_and_authorize_resource :job_opportunity, :through => :company, :param_method => "company_job_opportunity_params"

  # callbacks
  before_action :set_company
  before_action :set_qualifications
  before_action :set_skills
  before_action :set_company_job_opportunity, only: [:show, :edit, :update, :select_candidates,:destroy,:send_mail_to_all_shortlisted_candidates,:send_mail_to_shortlisted_candidate]
  before_action :get_candidates, only: [:show, :edit, :update]
  before_action :selected_candidates, only: [:show]
  before_action :get_job_events, only: [:index, :show, :edit]

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
    Candidate.find(params[:shortlist][:candidate_ids].reverse.drop(1)).each do |candidate|
      @company_job_opportunity.select_candidate(candidate)
    end
    redirect_to company_job_path(company_id:params[:company_id],id: params[:job_id]) and return
  end

  def send_mail_to_all_shortlisted_candidates
    begin 
      @company_job_opportunity.get_candidates_as_users.each do |user|
        UserNotifier.send_shortlist_mail_to(user,@company_job_opportunity).deliver_later
        @company_job_opportunity.change_status(user.info,:mailed)
      end
      flash[:success] = 'Messages sent successfully' 
      redirect_to :back
    #rescue 
      #flash[:alert] = 'Messages not send successfully'
      #redirect_to :back
    end
  end

  def send_mail_to_shortlisted_candidate
    begin
      candidate = @company_job_opportunity.candidates.find(params[:candidate_id])
      @company_job_opportunity.change_status(candidate,:mailed)
      UserNotifier.send_shortlist_mail_to(candidate.user,@company_job_opportunity).deliver_later
      flash[:success] = 'Messages sent successfully' 
      redirect_to :back
    #rescue 
      #flash[:alert] = 'Messages not send successfully'
      #redirect_to :back
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

    def get_job_events
      @events = @company_job_opportunity.events
    end

    def selected_candidates
      @selected_candidates = @company_job_opportunity.get_candidates_with_status
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_job_opportunity_params
       params.require(:company_job_opportunity).permit(:id, :title, :shift, :description, :number_of_positions, :company_id, :status, :ctc, :experience, qualifications_attributes: [:id, :course, :domain, :_destroy], skills_attributes: [:id, :name, :_destroy])
    end
end
