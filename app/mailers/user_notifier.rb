class UserNotifier < ApplicationMailer
  default from: 'rams.recruit.do@gmail.com'

  def send_shortlist_mail_to(candidates,job)

    @job = job
    @emails = candidates.pluck(:email)
    mail(:to => @emails.join(','),:subject => "Congratualations! You have been selected for #{@job.title} at #{@job.company.name}", :bcc =>@emails.join(','))
  end
end
