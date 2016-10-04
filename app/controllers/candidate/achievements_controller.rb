class Candidate::AchievementsController < ApplicationController

  # layouts 
  layout 'candidate/layout'

  # helpers
  include Candidate::AchievementsHelper

  # filters/callbacks
  before_action :set_candidate
  before_action :set_candidate_achievement, only: [:show, :update, :destroy]
    

  # GET /candidate/:id/achievements
  # GET /candidate/:id/achievements.json
  def index
    @candidate_achievements = @candidate.achievements
  end


  # GET /candidate/:id/achievements/edit
  def edit
    @candidate_achievements = @candidate.achievements
    @new_candidate_achievement = Candidate::Achievement.new
  end

  # POST /candidate/:id/achievements
  # POST /candidate/:id/achievements.json
  def create
    @candidate_achievement  = @candidate.achievements.build(candidate_achievement_params)

    respond_to do |format|
      if @candidate_achievement.save
        flash[:success] =  'Achievement was successfully created.' 
        format.html { redirect_to edit_candidate_achievements_path(params[:candidate_id])}
        format.json { render :show, status: :created, location: @candidate_achievement }
      else
        flash[:failure] = 'Achievement creation  unsuccessful'
        format.html { redirect_to edit_candidate_achievements_path(params[:candidate_id])}
        format.json { render json: @candidate_achievement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /candidate/:id/achievements/1
  # PATCH/PUT /candidate/:id/achievements/1.json
  def update
    respond_to do |format|
      if @candidate_achievement.update(candidate_achievement_params)
        flash[:success] =  'Achievement was successfully updated.' 
        format.html { redirect_to edit_candidate_achievements_path(params[:candidate_id]) }
        format.json { render :show, status: :ok, location: @candidate_achievement }
      else
        flash[:failure] = 'Achievement updation unsuccessful'
        @candidate_achievements = [@candidate_achievement]
        @new_candidate_achievement = Candidate::Achievement.new
        format.html { redirect edit_candidate_achievements_path(params[:candidate_id]) }
        format.json { render json: @candidate_achievement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /candidate/:id/achievements/1
  # DELETE /candidate/:id/achievements/1.json
  def destroy
    @candidate_achievement.destroy
    respond_to do |format|
      flash[:success] =  'Achievement was successfully deleted.' 
      format.html { redirect_to edit_candidate_achievements_path(params[:candidate_id]) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_candidate
      @candidate = Candidate.find(params[:candidate_id])
    end

    def set_candidate_achievement
      @candidate_achievement = @candidate.achievements.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def candidate_achievement_params
      params.require(:candidate_achievement).permit(:title,:description)
    end
end
