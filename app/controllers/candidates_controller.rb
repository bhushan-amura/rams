class CandidatesController < ApplicationController

  load_and_authorize_resource


  # filters/callbacks
  before_action :set_candidate, only: [:show, :edit, :update, :destroy, :home, :resume,:apply_job,:jobs]

  # GET /candidates
  # GET /candidates.json
  def index
    @candidates = Candidate.all
  end

  # GET /candidates/1
  # GET /candidates/1.json
  def show
  end

  # GET /candidates/new
  def new
    @candidate = Candidate.new
  end

  # GET /candidates/1/edit
  def edit
  end

  # POST /candidates
  # POST /candidates.json
  def create
    @candidate = Candidate.new(candidate_params)
    @candidate.user_id = current_user.id

    respond_to do |format|
      if @candidate.save
        flash[:notice] = 'Candidate was successfully created.'
        format.html { redirect_to home_candidate_path(@candidate) }
        format.json { render :show, status: :created, location: @candidate }
      else
        format.html { render :new }
        format.json { render json: @candidate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /candidates/1
  # PATCH/PUT /candidates/1.json
  def update
    respond_to do |format|
      if @candidate.update(candidate_params)
        flash[:success] = 'Candidate was successfully updated'
        format.html { redirect_to edit_candidate_path(@candidate), notice: 'Candidate was successfully updated.' }
        format.json { render :show, status: :ok, location: @candidate }
      else
        flash[:failure] = 'Candidate updation unsuccessful'
        format.html { render :edit }
        format.json { render json: @candidate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /candidates/1
  # DELETE /candidates/1.json


  def destroy
    @candidate.destroy
    respond_to do |format|
      flash[:notice] = 'Candidate was successfully destroyed.'
      format.html { redirect_to candidates_url }
      format.json { head :no_content }
    end
  end

  # HOME /candidate/1/home
  def home
  end

  # RESUME /candidate/1/resume
  def resume
    authorize! :resume, current_user.info
    render layout: "company"
  end

  # SHOW JOBS 
  def jobs
    @companies = Company.paginate(:page => params[:page],:per_page => 10) 
  end

  def apply_job
    job = Company::JobOpportunity.find(params[:job_id])
    job.candidates_job_opportunities << CandidatesJobOpportunity.new(candidate_id:@candidate.id,status: CandidatesJobOpportunity.statuses[:applied])
    redirect_to :back
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_candidate
      @candidate = Candidate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def candidate_params
      params.require(:candidate).permit( :first_name,:last_name,:dob,:gender, :marital_status, :status,:languages,:summary)
    end
end
