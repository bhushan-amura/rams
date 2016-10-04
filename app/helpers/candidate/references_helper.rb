module Candidate::ReferencesHelper
  def reference_path_params(reference)
    { candidate_id:params[:candidate_id], id:reference.id }
  end
end
