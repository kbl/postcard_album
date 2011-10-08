class NewsletterAccountController < MailchimpController

  before_filter :authorize, :only => []

  def new
    @account = NewsletterAccount.new
  end

  def create
    @account = NewsletterAccount.new(params[:account])
    if @account.valid?
      begin
        @mailchimp = Hominid::API.new(MAILCHIMP_API_KEY)
        @mailchimp.listSubscribe(MAILCHIMP_LIST_ID, @account.email, {'FNAME' => @account.name})
        flash[:notice] = t 'newsletter.success'

        redirect_to root_path
      rescue Hominid::APIError => e
        logger.error e
        flash[:error] = t 'newsletter.error'
        redirect_to root_path
      end
    else
      render 'new'
    end
  end

end
