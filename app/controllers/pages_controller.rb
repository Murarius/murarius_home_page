# class PagesController < ApplicationController
class PagesController < ApplicationController
  def start
    @message = Message.new
  end

  def contact_message
    @message = Message.new(params[:message][:from], params[:message][:subject], params[:message][:content])
    if @message.valid?
      SimpleMailer.send_message(@message).deliver_later
      flash[:success] = 'Contact message sent...'
      redirect_to root_url
    else
      render 'start'
    end
  end
end
