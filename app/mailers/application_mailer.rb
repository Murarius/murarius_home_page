# class ApplicationMailer < ActionMailer::Base
class ApplicationMailer < ActionMailer::Base
  default to: ENV['EMAIL_TO']
  layout 'mailer'
end
