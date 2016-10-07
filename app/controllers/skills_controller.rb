class SkillsController < ApplicationController

  # layout 
  layout 'candidate/layout'

  # helpers
  include SkillsHelper

  # filter/callbacks
  before_action :set_entity
  before_action :set_skill, only: [:show, :destroy]

  # GET /skills
  # GET /skills.json
  def index
    authorize! :index, @entity
    @skills = @entity.skills
  end

  def all_skills
    @skills = Skill.all
    respond_to do |format|
      format.json{ render :json => @skills }
    end
  end


  # GET /skills/1/edit
  def edit
    authorize! :edit, @entity
    @entity_skill = Skill.new
    @entity_skills = @entity.skills
  end

  # PATCH/PUT /skills/1
  # PATCH/PUT /skills/1.json
  def update
    authorize! :update, @entity
    skill_names = skill_params[:names].split(',')
    entity_skills = skill_names.each_with_object([]) do |skill,skills|
      skill = Skill.find_or_create_by(name:skill)
      skills << skill
    end

    respond_to do |format|
      if @entity.skills = entity_skills 
        flash[:success] = 'Skills successfully updated'
        format.html { redirect_to edit_candidate_skill_index_path(params[:candidate_id]),notice: 'Skill was successfully updated.' }
        format.json { render :show, status: :ok, location: @skill }
      else
        flash[:failure] = 'Skill updation unsuccessful'
        format.html { render :edit }
        format.json { render json: @skill.errors, status: :unprocessable_entity }
      end
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

    def set_skill
      @skill = @entity.skills.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def skill_params
      params.require(:skills).permit(:names)
    end
end
