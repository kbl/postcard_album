class NewsletterMessageController < MailchimpController

  def new
    @message = NewsletterMessage.new
  end

  def create
    @message = NewsletterMessage.new(params[:message])
    if @message.valid?
      @mailchimp = Hominid::API.new(MAILCHIMP_API_KEY)

      campaignId = @mailchimp.campaignCreate('regular',
          { list_id: MAILCHIMP_LIST_ID,
            subject: @message.title,
            template_id: MAILCHIMP_TEMPLATE_ID,
            from_email: 'mirek.pietraszek@gmail.com',
            from_name: 'www.kolekcja.pietraszek.pl'
          },
          { html_body: @message.body,
            text: @message.body
          })
      @mailchimp.campaignSendNow(campaignId)
      
      redirect_to root_path
    else
      render 'new'
    end
  end

end
