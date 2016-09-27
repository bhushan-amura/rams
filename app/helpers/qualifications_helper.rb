module QualificationsHelper

  # Return qualification path of candidate or job as string
  def qualification_path(*prefix_or_suffix)
    prefix_or_suffix = prefix_or_suffix[0]
    path = @entity.instance_of?(Candidate) ? 'candidate_qualification' : 'job_qualification'
    path = prefix_or_suffix.nil? ? path : (prefix_or_suffix == 'index') ? path+'_'+prefix_or_suffix : prefix_or_suffix+'_'+path
    path+'_path'
  end

  # Return qualification path params which accepts an object
  def qualification_path_params(qualification)
    id = qualification.id
    @entity.instance_of?(Candidate) ? {candidate_id: params[:candidate_id],id: id} : {company_id: params[:company_id],job_id: params[:job_id],id: id}
  end

end
