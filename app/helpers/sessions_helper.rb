# module SessionsHelper
module SessionsHelper
  def log_in(owner)
    session[:remember_token] = owner.id
    self.current_owner = owner
  end

  def logged_in?
    !current_owner.nil?
  end

  def current_owner=(owner)
    @current_owner = owner
  end

  def current_owner
    @current_owner ||= Owner.find(session[:remember_token]) if session[:remember_token]
  end

  def must_be_logged_in
    return if logged_in?
    flash[:error] = 'Please log in.'
    redirect_to root_url
  end

  def sign_out
    session.delete(:remember_token)
    self.current_owner = nil
  end
end
