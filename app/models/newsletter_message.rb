class NewsletterMessage

  include ActiveModel::Validations

  attr :title, :body

  validates_presence_of :title, :body

  def initialize(params = {}) 
    @title = params[:title]
    @body = params[:body]
  end

end
