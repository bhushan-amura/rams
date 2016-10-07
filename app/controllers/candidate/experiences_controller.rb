class Candidate::ExperiencesController < ApplicationController

  load_and_authorize_resource :candidate
  load_and_authorize_resource :experience, :through => :candidate, :param_method => :candidate_experience_params
  #layout 
  layout 'candidate/layout'
  # helpers
  include Candidate::ExperiencesHelper

  # filters/callbacks
  before_action :set_candidate
  before_action :set_candidate_experience, only: [:show,:update, :destroy]

  # GET /candidate/:id/experiencess
  # GET /candidate/:id/experiencess.json
  def index
    @candidate_experiences = @candidate.experiences
  end


  # GET /candidate/:id/experiencess/1/edit
  def edit
    @candidate_experiences = @candidate.experiences
    @new_candidate_experience = Candidate::Experience.new
  end

  # POST /candidate/:id/experiencess
  # POST /candidate/:id/experiencess.json
  def create
    @candidate_experience = @candidate.experiences.build(candidate_experience_params)

    respond_to do |format|
      if @candidate_experience.save
        flash[:success] =  'Experience was successfully created.'
        format.html { redirect_to edit_candidate_experiences_path(params[:candidate_id]) }
        format.json { render :show, status: :created, location: @candidate_experience }
      else
        flash[:failure] =  'Experience creation unsuccessful.'
        format.html { redirect_to edit_candidate_experiences_path(params[:candidate_id]) }
        format.json { render json: @candidate_experience.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /candidate/:id/experiencess/1
  # PATCH/PUT /candidate/:id/experiencess/1.json
  def update
    respond_to do |format|
      if @candidate_experience.update(candidate_experience_params)
        flash[:success] =  'Experience was successfully updated.'
        format.html { redirect_to edit_candidate_experiences_path(params[:candidate_id])}
        format.json { render :show, status: :ok, location: @candidate_experience }
      else
        flash[:failure] =  'Experience updation unsuccessful.'
        @new_candidate_experience = Candidate::Experience.new
        @candidate_experiences = [@candidate_experience]
        format.html { redirect_to edit_candidate_experiences_path(params[:candidate_id]) }
        format.json { render json: @candidate_experience.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /candidate/:id/experiencess/1
  # DELETE /candidate/:id/experiencess/1.json
  def destroy
    @candidate_experience.destroy
    flash[:success] =  'Experience was successfully deleted'
    respond_to do |format|
      format.html { redirect_to edit_candidate_experiences_path}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_candidate
      @candidate = Candidate.find(params[:candidate_id])
    end

    def set_candidate_experience
      @candidate_experience = @candidate.experiences.find(params[:id])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def candidate_experience_params
      params.require(:candidate_experience).permit(:name,:start_date,:end_date,:description,:shift_type)
    end
end
