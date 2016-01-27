# class SessionsController < ApplicationController
class SessionsController < ApplicationController
  def new
    render layout: 'short_layout'
  end

  def create
    owner = Owner.find_by(login: params[:session][:login].downcase)
    if owner && owner.authenticate(params[:session][:password])
      sign_in owner
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
end
