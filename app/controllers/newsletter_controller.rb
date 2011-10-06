class NewsletterController < ApplicationController

  def index
  end

  def new
  end
  
  def create
    @mailchimp = Hominid::API.new(API_KEY)
    @account = NewsletterAccount.new(params[:account])
    #@mailchimp.listSubscribe('be0cc86ae2', )
  end

end
