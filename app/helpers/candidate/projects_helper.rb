module Candidate::ProjectsHelper
  def project_path_params(project)
    { candidate_id:params[:candidate_id], id:project.id }
  end

end
