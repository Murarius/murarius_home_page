# class PagesController < ApplicationController
class PagesController < ApplicationController
  def start
    @message = Message.new
  end

  def contact_message
    @message = Message.new(params[:message][:from], params[:message][:subject], params[:message][:content])
    SimpleMailer.send_message(@message).deliver_later
    render 'start'
  end
end
