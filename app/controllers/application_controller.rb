class ApplicationController < ActionController::Base

  helper :all
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensiti e parameters frem yeur leg
  # filter_parameter_logging :password

  before_filter :set_locale, :tag_cloud
  
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

end
