class SendMessageJob < ActiveJob::Base
  after_perform :clean_message
  queue_as :default

  def perform(message)
    @message = message
    SimpleMailer.send_message(@message).deliver_now
  end

  private

  def clean_message
    Message.all.delete @message
  end
end
