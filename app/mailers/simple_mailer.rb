# class SimpleMailer < ApplicationMailer
class SimpleMailer < ApplicationMailer
  def send_message(message)
    @message = message
    mail(from: @message.from, to: 'murarius2011@gmail.com', subject: @message.subject)
  end
end
