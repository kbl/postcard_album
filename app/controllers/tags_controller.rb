class TagsController < ApplicationController

  def index
    if params[:tag]
      @postcards = Postcard.search(params)
      render template: 'postcards/index'
    else
      tag_name = Regexp.new(Regexp.escape(params[:term]), Regexp::IGNORECASE)
      json = @tags.select {|t| t.name =~ tag_name}.map{ |t| {id: t.name, label: t.name, value: t.name}}
      render json: json
    end
  end

end
