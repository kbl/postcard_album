  class NewsletterAccount

    include ActiveModel::Validations

    attr :email, :name

    validates_presence_of :email, :name
    validates_format_of :email, with: /^[a-z0-9_-]+@[a-z0-9_-.]{4,}$/i

    def initialize(params = {}) 
      @email = params[:email]
      @name = params[:name]
    end

  end
