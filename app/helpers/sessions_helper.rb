# module SessionsHelper
module SessionsHelper
  def log_in(owner)
    remember_token = Owner.new_remember_token
    session[:remember_token] = remember_token
    owner.update_attribute(:remember_token, Owner.digest(remember_token))
    self.current_owner = owner
  end

  def logged_in?
    !current_owner.nil?
  end

  def current_owner=(owner)
    @current_owner = owner
  end

  def current_owner
    remember_token = Owner.digest(session[:remember_token])
    @current_owner ||= Owner.find_by(remember_token: remember_token)
  end

  def must_be_logged_in
    return if logged_in?
    flash[:danger] = 'Please log in.'
    redirect_to root_url
  end

  def sign_out
    current_owner.update_attribute(:remember_token, Owner.digest(Owner.new_remember_token))
    session.delete(:remember_token)
    self.current_owner = nil
  end
end
