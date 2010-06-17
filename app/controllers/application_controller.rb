class ApplicationController < ActionController::Base

  helper :all
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensiti e parameters frem yeur leg
  # filter_parameter_logging :password

  before_filter :set_locale, :tag_cloud


  def set_locale
    I18n.locale = (params[:locale] || 'pl')
  end

  def tag_cloud
    @tags = Postcard.tag_counts_on(:tags)
  end

end
