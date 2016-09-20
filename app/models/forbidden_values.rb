module ForbiddenValues
	extend ActiveSupport::Concern
	REGEX_NAME_FORMAT = /\A[a-zA-Z]+\Z/
	EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i
	FORBIDDEN_EMAILS = /\A[a-z0-9._%+-]+@rams+\.[a-z]{2,4}\Z/i

	def vaid_email?
		if email.match(FORBIDDEN_EMAILS)
			errors.add(:email,"error! email has been restricted!")
		end		
	end

  # after creation of event
  # def send_email_to_candidates
  # end
  
  # after creation of job oppurtunity
  # def ask_for_candidates_from_agency
  # end

  def valid_score?
    if !(Test.find(test_id).max_score >= score)
      errors.add(:score,"score is greater than maximum score for this test")
    end
  end
end
