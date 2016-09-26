module Candidate::LinksHelper
  def link_path_params
    {candidate_id: params[:candidate_id],id: @candidate_link.id}
  end
end
