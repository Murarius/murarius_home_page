# class PagesController < ApplicationController
class OwnersController < ApplicationController
  def edit_password
    @owner = Owner.find(params[:id])
    render('new_password', layout: 'short_layout')
  end

  def update_password
    @owner = Owner.find(params[:id])
    if @owner.update_attributes(owner_params)
      flash[:success] = 'Owner password was changed.'
      redirect_to root_url
    else
      render('new_password', layout: 'short_layout')
    end
  end

  private

  def owner_params
    params.require(:owner).permit(:password, :password_confirmation)
  end
end
