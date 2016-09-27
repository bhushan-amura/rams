module SkillsHelper

  def skill_path(*prefix_or_suffix)
    prefix_or_suffix = prefix_or_suffix[0]
    path = @entity.instance_of?(Candidate) ? 'candidate_skill' : 'job_skill'
    path = prefix_or_suffix.nil? ? path : (prefix_or_suffix == 'index') ? path+'_'+prefix_or_suffix : prefix_or_suffix+'_'+path
    path+'_path'
  end

  def skill_path_params(skill)
    id = skill.id
    @entity.instance_of?(Candidate) ? {candidate_id: params[:candidate_id],id: id} : {company_id: params[:company_id],job_id: params[:job_id],id: id}
  end
end
