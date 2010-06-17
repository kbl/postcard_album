class TagsController < ApplicationController

  def show
    @postcards = Postcard.tagged_with(params[:id]).paginate(:page => params[:page], :order => 'created_at DESC')

    current_navigation :postcards
    render :template => 'postcards/index', :layout => 'postcards'
  end

end
