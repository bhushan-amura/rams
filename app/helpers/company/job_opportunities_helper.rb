module Company::JobOpportunitiesHelper
	def job_opportunity_path_params(job_object)
		{ company_id:job_object.company_id,id:job_object.id }
	end
end
