class Candidate::ProjectsController < CandidatesController
  before_action only: [:show, :edit, :update, :destroy, :index] do
    set_candidate(params[:candidate_id])
  end

  # GET /candidate/projects
  # GET /candidate/projects.json
  def index
    @candidate_projects = Candidate::Project.all
  end

  # GET /candidate/projects/1
  # GET /candidate/projects/1.json
  def show
  end

  # GET /candidate/projects/new
  def new
    @candidate_project = Candidate::Project.new
  end

  # GET /candidate/projects/1/edit
  def edit
  end

  # POST /candidate/projects
  # POST /candidate/projects.json
  def create
    @candidate_project = Candidate::Project.new(candidate_project_params)

    respond_to do |format|
      if @candidate_project.save
        format.html { redirect_to @candidate_project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @candidate_project }
      else
        format.html { render :new }
        format.json { render json: @candidate_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /candidate/projects/1
  # PATCH/PUT /candidate/projects/1.json
  def update
    respond_to do |format|
      if @candidate_project.update(candidate_project_params)
        format.html { redirect_to @candidate_project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @candidate_project }
      else
        format.html { render :edit }
        format.json { render json: @candidate_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /candidate/projects/1
  # DELETE /candidate/projects/1.json
  def destroy
    @candidate_project.destroy
    respond_to do |format|
      format.html { redirect_to candidate_projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_candidate
    #   @candidate = Candidate.find(params[:candidate_id])
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    def candidate_project_params
      params.require(:candidate_achievements).permit(:title,:domain,:description,:organisation,:position)
    end
end
