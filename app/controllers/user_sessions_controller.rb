class UserSessionsController < ApplicationController

  before_action :authorize, :include => []

  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])

    if @user_session.save
      flash[:notice] = t :successfully_login
      redirect_to new_postcard_path
    else
      render :action => 'new'
    end
  end

  def destroy
    @user_session = UserSession.find
    @user_session.destroy
    flash[:notice] = t :successfully_logout

    redirect_to root_path
  end
  
  protected

  def check_authorization?
    false
  end

end
