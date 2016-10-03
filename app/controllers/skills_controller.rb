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
    @entity_skill = Skill.new
    @entity_skills = @entity.skills
  end

  # POST /skills
  # POST /skills.json
  def create
    @skill = Skill.new(skill_params)

    respond_to do |format|
      if @skill.save
        @entity.skills << @skill
        flash[:notice] = 'Skill was successfully created.'
        format.html { redirect_to self.send(skill_path,skill_path_params(@skill)) }
        format.json { render :show, status: :created, location: @skill }
      else
        format.html { render :new }
        format.json { render json: @skill.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /skills/1
  # PATCH/PUT /skills/1.json
  def update
    skill_names = skill_params[:names].split(',')
    entity_skills = skill_names.each_with_object([]) do |skill,skills|
      skill = Skill.find_or_create_by(name:skill)
      skills << skill
    end

    respond_to do |format|
      if @entity.skills = entity_skills 
        format.html { redirect_to edit_candidate_skill_index_path(params[:candidate_id]),notice: 'Skill was successfully updated.' }
        format.json { render :show, status: :ok, location: @skill }
      else
        format.html { render :edit }
        format.json { render json: @skill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /skills/1
  # DELETE /skills/1.json
  def destroy
    @entity.skills.destroy(@skill)
    flash[:notice] = 'Skill was successfully destroyed.'
    respond_to do |format|
      format.html { redirect_to self.send(skill_path('index')) }
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

    def set_skill
      @skill = @entity.skills.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def skill_params
      params.require(:skills).permit(:names)
    end
end
