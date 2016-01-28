# class SessionsController < ApplicationController
class SessionsController < ApplicationController
  def new
    render layout: 'short_layout'
  end

  def create
    owner = Owner.find_by(login: params[:session][:login].downcase)
    if owner_with_good_password?(owner)
      log_in owner
      flash[:success] = "Welcome #{@current_owner.login} !!!"
      redirect_to root_url
    else
      flash.now[:error] = 'Invalid login/password combination'
      render 'new', layout: 'short_layout'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end

  private

  def owner_with_good_password?(owner)
    owner && owner.authenticate(params[:session][:password]) ? true : false
  end
end
