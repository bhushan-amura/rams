class ExampleMailer < ApplicationMailer
  default from:"akash.s@amuratech.com"

  def sample_email(user)
    @user = user
    mail(to: @user.email, subject: 'Sample Email')
  end
end
