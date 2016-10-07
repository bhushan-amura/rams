class UserNotifier < ApplicationMailer
  default from: 'rams.recruit.do@gmail.com'

  def send_shortlist_mail_to(candidate,job)
    @job = job
    @company = @job.company
    @email = candidate.email
    mail(:to => @email,:subject => "Congratualations! You have been selected for #{@job.title} at #{@job.company.name}")
  end
end
