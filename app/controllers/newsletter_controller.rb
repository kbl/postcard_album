class NewsletterController < ApplicationController

  def new
    @account = NewsletterAccount.new
  end
  
  def create
    @account = NewsletterAccount.new(params[:account])
    if @account.valid?
      @mailchimp = Hominid::API.new(API_KEY)
      @mailchimp.listSubscribe('be0cc86ae2', @account.email, {'FNAME' => @account.name})
      flash[:notice] = t 'newsletter.success'

      redirect_to root_path
      rescue
        flash[:notice] = t 'newsletter.error'
        redirect_to root_path
    else
      render 'new'
    end
  end

end
