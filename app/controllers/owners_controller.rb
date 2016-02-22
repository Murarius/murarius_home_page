# class PagesController < ApplicationController
class OwnersController < ApplicationController
  def edit_password
    @owner = Owner.find(params[:id])
    render('new_password', layout: 'short_layout')
  end

  def update_password
    @owner = Owner.find(params[:id])
    if @owner.update_attributes(owner_params)
      @good_password = true
      flash[:success] = 'Owner password was changed.'
    else
      @good_password = false
      flash.now[:error] = 'password is to short (min. 8 chars...) or not confirmed...'
    end

    respond_to do |format|
      format.html { @good_password ? redirect_to(root_url) : render('new_password', layout: 'short_layout') }
      format.js
    end
  end

  private

  def owner_params
    params.require(:owner).permit(:password, :password_confirmation)
  end
end
