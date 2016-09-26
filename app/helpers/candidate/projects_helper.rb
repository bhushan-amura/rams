module Candidate::ProjectsHelper
  def project_path_params
    { candidate_id:params[:candidate_id], id:@candidate_project.id }
  end

end
