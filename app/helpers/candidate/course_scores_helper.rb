module Candidate::CourseScoresHelper
  def course_score_path_params(course_score)
    { candidate_id:params[:candidate_id], id:course_score.id }
  end
end
