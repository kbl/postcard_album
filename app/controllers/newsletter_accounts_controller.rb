class NewsletterAccountsController < ApplicationController

  before_filter :authorize, :except => [:new, :delete]
  
  def new
    @newsletter_account = NewsletterAccount.new
  end

end
