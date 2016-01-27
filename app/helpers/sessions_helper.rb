# module SessionsHelper
module SessionsHelper
  def sign_in(user)
    remember_token = Owner.new_remember_token
    session[:remember_token] = remember_token
    user.update_attribute(:remember_token, Owner.digest(remember_token))
    self.current_user = user
  end

  def logged_in?
    !current_user.nil?
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    remember_token = Owner.digest(session[:remember_token])
    @current_user ||= Owner.find_by(remember_token: remember_token)
  end

  def logged_in_user
    return if logged_in?
    # store_location
    flash[:danger] = 'Please log in.'
    redirect_to root_url
  end

  def sign_out
    current_user.update_attribute(:remember_token,
                                  Owner.digest(Owner.new_remember_token))
    session.delete(:remember_token)
    self.current_user = nil
  end
end
