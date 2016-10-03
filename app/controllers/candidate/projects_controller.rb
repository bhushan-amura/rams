class Candidate::ProjectsController < ApplicationController

  # layouts 
  layout 'candidate/layout'

  # helpers
  include Candidate::ProjectsHelper

  # filters/callbacks
  before_action :set_candidate
  before_action :set_candidate_project, only: [:show, :update, :destroy]
    

  # GET /candidate/:id/projects
  # GET /candidate/:id/projects.json
  def index
    @candidate_projects = @candidate.projects
  end


  # GET /candidate/:id/projects/1/edit
  def edit
    @candidate_projects = @candidate.projects
    @new_candidate_project = Candidate::Project.new
  end

  # POST /candidate/:id/projects
  # POST /candidate/:id/projects.json
  def create
    @candidate_project = @candidate.projects.build(candidate_project_params)

    respond_to do |format|
      if @candidate_project.save
        flash[:success] ='Project was successfully created.' 
        format.html { redirect_to edit_candidate_projects_path(params[:candidate_id])}
        format.json { render :show, status: :created, location: @candidate_project }
      else
        flash[:failure] ='Project creation unsuccessful.' 
        format.html { redirect_to edit_candidate_projects_path(params[:candidate_id])}
        format.json { render json: @candidate_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /candidate/:id/projects/1
  # PATCH/PUT /candidate/:id/projects/1.json
  def update
    respond_to do |format|
      if @candidate_project.update(candidate_project_params)
        flash[:success] ='Project was successfully updated.' 
        format.html { redirect_to edit_candidate_projects_path(params[:candidate_id])}
        format.json { render :show, status: :ok, location: @candidate_project }
      else
        flash[:failure] ='Project updation unsuccessful.' 
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
      flash[:success] =  'Project was successfully destroyed.' 
      format.html { redirect_to edit_candidate_projects_path(params[:candidate_id])}
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
