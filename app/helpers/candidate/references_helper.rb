module Candidate::ReferencesHelper
  def reference_path_params
    { candidate_id:params[:candidate_id], id:@candidate_reference.id }
  end
end
