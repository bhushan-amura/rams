module ReviewsHelper
  def review_path_params(review)
    id = review.id
    @entity.instance_of?(Candidate) ? {candidate_id: params[:candidate_id],id: id} : {company_id: params[:company_id],id: id}
  end
end
