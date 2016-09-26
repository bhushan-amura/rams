module Candidate::ExperiencesHelper

  def experience_path_params
    {candidate_id:params[:candidate_id],id:@candidate_experience.id}
  end

end
