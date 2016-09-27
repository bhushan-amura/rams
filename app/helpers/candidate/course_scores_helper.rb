module Candidate::CourseScoresHelper
  def course_scores_path_params
    { candidate_id:params[:candidate_id], id:@candidate_course_score.id }
  end
end
