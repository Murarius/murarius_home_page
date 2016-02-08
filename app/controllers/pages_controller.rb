# class PagesController < ApplicationController
class PagesController < ApplicationController
  def start
    bypass_humanizer = true
    @message = Message.new(bypass_humanizer)
  end

  def contact_message
    bypass_humanizer = false

    @message = Message.new(bypass_humanizer, message_params(params[:message]))
    if @message.valid?
      SimpleMailer.send_message(@message).deliver_later
      flash[:success] = 'Contact message sent...'
      redirect_to root_url
    else
      render 'start'
    end
  end

  private

  def message_params(message_params)
    message = {}
    message[:from] = message_params[:from]
    message[:subject] = message_params[:subject]
    message[:content] = message_params[:content]
    message[:humanizer_question_id] = message_params[:humanizer_question_id]
    message[:humanizer_answer] = message_params[:humanizer_answer]
    message
  end
end
