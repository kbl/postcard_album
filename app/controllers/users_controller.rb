class UsersController < ApplicationController

  def edit
    @user = current_user
  end

  def update
    @user = current_user

    if @user.update_attributes(params[:user])
      flash[:notice] = 'User was successfully updated.'
      render root_path
    else
      render :action => :edit
    end
  end

end
