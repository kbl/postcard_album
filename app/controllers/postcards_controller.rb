class PostcardsController < ApplicationController

  before_filter :set_navigation


  def index
    @postcards = Postcard.paginate(:page => params[:page], :order => 'created_at DESC')
  end

  def show
    @postcard = Postcard.find(params[:id])
  end

  def new
    @postcard = Postcard.new
    @postcard.images.build
    @publishers = Publisher.all.collect { |p| [p.name, p.id] }
  end

  def edit
    @postcard = Postcard.find(params[:id])
    @publishers = Publisher.all.collect { |p| [p.name, p.id] }
  end

  def create
    @postcard = Postcard.new(params[:postcard])

    if @postcard.save
      flash[:notice] = t :postcard_was_created
      redirect_to(@postcard)
    else
      render :action => "new"
    end
  end

  def update
    @postcard = Postcard.find(params[:id])

    if @postcard.update_attributes(params[:postcard])
      flash[:notice] = t :postcard_was_updated
      redirect_to(@postcard)
    else
      render :action => "edit"
    end
  end

  def destroy
    @postcard = Postcard.find(params[:id])
    @postcard.destroy

    redirect_to(postcards_url)
  end

  
  private

  def set_navigation
    current_navigation :postcards    
  end

end
