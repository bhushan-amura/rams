
module Company::EventsHelper
	def events_path_params(event_object)
		{ company_id:event_object[:company_id],job_id:event_object[:id] }
	end
	def job_events_path_params(event_object)
		{ company_id:params[:company_id],job_id:params[:job_id],id:event_object.id }
	end
end
