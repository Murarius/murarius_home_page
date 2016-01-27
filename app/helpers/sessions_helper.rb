# module SessionsHelper
module SessionsHelper

  def current_user
    @current_user ||= Owner.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !current_user.nil?
  end
end
