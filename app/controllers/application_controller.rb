class ApplicationController < ActionController::Base

  helper :all
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  filter_parameter_logging :password, :password_confirmation

  before_filter :set_locale, :tag_cloud
  before_filter :authorize, :except => [:index, :show]

  helper_method :current_user



  private

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end
  
  def set_locale
    I18n.locale = (params[:locale] || 'pl')
  end

  def tag_cloud
    @tags = Postcard.tag_counts_on(:tags)
  end

  def authorize
    unless current_user or not check_authorization?
      flash[:error] = 'Nu nu nu!'
      redirect_to root_path
    end
  end

  protected

  def check_authorization?
    true
  end

end
