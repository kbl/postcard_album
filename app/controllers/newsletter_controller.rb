class NewsletterController < ApplicationController
  

  def index
  end

  def new
  end
  
  def create
    @mailchimp = Hominid::API.new(API_KEY)
    p params
    #@mailchimp.listSubscribe('be0cc86ae2', )
  end

end
