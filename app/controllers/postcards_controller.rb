class PostcardsController < ApplicationController

  before_filter :set_navigation
  before_filter :seed_publishers, :only => [:index, :new, :edit]

  def index
    @postcards = Postcard.search(params)
  end

  def show
    @postcard = Postcard.find(params[:id])
  end

  def new
    @postcard = Postcard.new
    @postcard.images.build
  end

  def edit
    @postcard = Postcard.find(params[:id])
  end

  def create
    @postcard = Postcard.new(params[:postcard])

    if @postcard.save
      flash[:notice] = t :postcard_was_created
      redirect_to(@postcard)
    else
      seed_publishers
      render :action => "new"
    end
  end

  def update
    @postcard = Postcard.find(params[:id])

    if @postcard.update_attributes(params[:postcard])
      flash[:notice] = t :postcard_was_updated
      redirect_to(@postcard)
    else
      seed_publishers
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
    # TODO Rails3
    # current_navigation :postcards    
  end

  def seed_publishers
    @publishers = Publisher.find_all_combobox || []
  end

end
