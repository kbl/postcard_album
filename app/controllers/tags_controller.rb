class TagsController < ApplicationController

  def index
    if params[:id]
      @postcards = Postcard.tagged_with(params[:id]).paginate(:page => params[:page], :order => 'created_at DESC')
      @publishers = Publisher.find_all_combobox || []

      render template: 'postcards/index'
    else
      r = Regexp.new(Regexp.escape(params[:term]), Regexp::IGNORECASE)
      json = @tags.select {|t| t.name =~ r}.map{ |t| {id: t.name, label: t.name, value: t.name}}
      render json: json
    end
  end

end
