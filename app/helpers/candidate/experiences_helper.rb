module Candidate::ExperiencesHelper

  def experience_path_params(experience)
    {candidate_id:params[:candidate_id],id: experience}
  end

end
