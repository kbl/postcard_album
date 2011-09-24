class TagsController < ApplicationController

  def index
    if params[:id]
      @postcards = Postcard.tagged_with(params[:id]).paginate(:page => params[:page], :order => 'created_at DESC')
      @publishers = Publisher.find_all_combobox || []

      render template: 'postcards/index'
    else
      render json: @tags
    end
  end

end
