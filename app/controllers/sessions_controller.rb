# class SessionsController < ApplicationController
class SessionsController < ApplicationController
  def new
    respond_to do |format|
      format.html { render layout: 'short_layout' }
      format.js
    end
  end

  def create
    owner = Owner.find_by(login: params[:session][:login].downcase)
    if owner_with_good_password?(owner)
      log_in owner
      flash[:success] = "Welcome #{@current_owner.login} !!!"
      @login_success = true
    else
      flash.now[:error] = 'Invalid login/password combination'
      @login_success = false
    end

    respond_to do |format|
      format.html { @login_success ? redirect_to(root_url) : render('new', layout: 'short_layout') }
      format.js { @login_success }
    end
  end

  def destroy
    flash[:success] = "#{current_owner.login} Logged out!!!"
    sign_out
    redirect_to root_url
  end

  private

  def owner_with_good_password?(owner)
    owner && owner.authenticate(params[:session][:password]) ? true : false
  end
end
