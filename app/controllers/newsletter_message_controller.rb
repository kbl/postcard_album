class NewsletterMessageController < ApplicationController

  def new
    @message = NewsletterMessage.new
  end

  def create
    @message = NewsletterMessage.new(params[:message])
  end

end
