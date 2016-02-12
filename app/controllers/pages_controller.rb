# class PagesController < ApplicationController
class PagesController < ApplicationController
  def start
    bypass_humanizer = true
    @message = Message.new(bypass_humanizer)
  end

  def contact_message
    bypass_humanizer = false
    @message = Message.new(bypass_humanizer, message_params(params[:message]))

    respond_to do |format|
      format.html do
        @message.valid? ? contact_message_html_success(@message) : render('start')
      end
      format.js do
        contact_message_js_success(@message) if @message.valid?
      end
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

  def contact_message_html_success(message)
    SendMessageJob.perform_later(message)
    flash[:success] = 'Contact message sent...'
    redirect_to root_url
  end

  def contact_message_js_success(message)
    SendMessageJob.perform_later(message)
    flash.now[:success] = 'Contact message sent...'
  end
end
