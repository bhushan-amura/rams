module Candidate::LinksHelper
  def link_path_params(link)
    {candidate_id: params[:candidate_id],id: link.id}
  end
end
