class UserNotifier < ApplicationMailer

  def send_shortlist_mail_to(candidates,job)

    @job = job
    @emails = candidates.pluck(:email)
    mail(:to => "akash.s@amuratech.com",:subject => "Congratualations! You have been selected for #{@job.title} at #{@job.company.name}", :bcc =>@emails.join(','))
  end
end
