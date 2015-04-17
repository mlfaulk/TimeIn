class ModelMailer < ActionMailer::Base
  default from: "sample@sandbox6df7a5b10dec446ca305d787046bd34b.mailgun.org"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.model_mailer.new_record_notification.subject
  #
  
  def new_record_notification(record)
    @record = record
    mail to: "jjejje@stanford.edu", subject: "Success! You did it."
  end
end
