class Candidate::CourseScoresController < CandidatesController

  include Candidate::CourseScoresHelper

  before_action :set_candidate
  before_action :set_candidate_course_score,only: [:show, :edit, :update, :destroy]


  before_action :get_qualifications, only: [:edit, :update, :create, :new]

  # GET /candidate/course_scores
  # GET /candidate/course_scores.json
  def index
    @candidate_course_scores = @candidate.course_scores
  end

  # GET /candidate/course_scores/1
  # GET /candidate/course_scores/1.json
  def show
  end

  # GET /candidate/course_scores/new
  def new
    @candidate_course_score = Candidate::CourseScore.new
  end

  # GET /candidate/course_scores/1/edit
  def edit
  end

  # POST /candidate/course_scores
  # POST /candidate/course_scores.json
  def create
    @candidate_course_score = @candidate.course_scores.build(candidate_course_score_params)

    respond_to do |format|
      if @candidate_course_score.save
        format.html { redirect_to candidate_course_score_path(course_scores_path_params), notice: 'Course score was successfully created.' }
        format.json { render :show, status: :created, location: @candidate_course_score }
      else
        format.html { render :new }
        format.json { render json: @candidate_course_score.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /candidate/course_scores/1
  # PATCH/PUT /candidate/course_scores/1.json
  def update
    respond_to do |format|
      if @candidate_course_score.update(candidate_course_score_params)
        format.html { redirect_to candidate_course_score_path(course_scores_path_params), notice: 'Course score was successfully updated.' }
        format.json { render :show, status: :ok, location: @candidate_course_score }
      else
        format.html { render :edit }
        format.json { render json: @candidate_course_score.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /candidate/course_scores/1
  # DELETE /candidate/course_scores/1.json
  def destroy
    @candidate_course_score.destroy
    respond_to do |format|
      format.html { redirect_to candidate_course_scores_url, notice: 'Course score was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_candidate
      @candidate = Candidate.find(params[:candidate_id])
    end

    def set_candidate_course_score
      @candidate_course_score = @candidate.course_scores.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def candidate_course_score_params
      params.require(:candidate_course_score).permit(:start_year,:end_year,:score,:qualification_id)
    end

    # get all the availbale qualifications
    def get_qualifications
      @qualifications  = Qualification.all
    end
end
