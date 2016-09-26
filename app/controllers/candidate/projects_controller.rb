class Candidate::ProjectsController < CandidatesController

  include Candidate::ProjectsHelper

  before_action only: [:show, :edit, :update, :destroy, :index, :create] do
    set_candidate
  end

  before_action only: [:show, :edit, :update, :destroy] do
    set_candidate_project
  end

  # GET /candidate/:id/projects
  # GET /candidate/:id/projects.json
  def index
    @candidate_projects = @candidate.projects
  end

  # GET /candidate/:id/projects/1
  # GET /candidate/:id/projects/1.json
  def show
  end

  # GET /candidate/:id/projects/new
  def new
    @candidate_project = Candidate::Project.new
  end

  # GET /candidate/:id/projects/1/edit
  def edit
  end

  # POST /candidate/:id/projects
  # POST /candidate/:id/projects.json
  def create
    @candidate_project = @candidate.projects.build(candidate_project_params)

    respond_to do |format|
      if @candidate_project.save
        format.html { redirect_to candidate_project_path(project_path_params), notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @candidate_project }
      else
        format.html { render :new }
        format.json { render json: @candidate_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /candidate/:id/projects/1
  # PATCH/PUT /candidate/:id/projects/1.json
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

  # DELETE /candidate/:id/projects/1
  # DELETE /candidate/:id/projects/1.json
  def destroy
    @candidate_project.destroy
    respond_to do |format|
      format.html { redirect_to candidate_projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_candidate
      @candidate = Candidate.find(params[:candidate_id])
    end
    def set_candidate_project
      @candidate_project = @candidate.projects.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def candidate_project_params
      params.require(:candidate_project).permit(:title,:domain,:description,:organisation,:position,:start_date,:end_date)
    end
end
