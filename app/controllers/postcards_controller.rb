class PostcardsController < ApplicationController

  before_filter :set_navigation


  # GET /postcards
  # GET /postcards.xml
  def index
    @postcards = Postcard.paginate(:page => params[:page], :order => 'created_at DESC')
  end

  # GET /postcards/1
  # GET /postcards/1.xml
  def show
    @postcard = Postcard.find(params[:id])
  end

  # GET /postcards/new
  # GET /postcards/new.xml
  def new
    @postcard = Postcard.new
    @postcard.images.build
  end

  # GET /postcards/1/edit
  def edit
    @postcard = Postcard.find(params[:id])
  end

  # POST /postcards
  # POST /postcards.xml
  def create
    @postcard = Postcard.new(params[:postcard])

    if @postcard.save
      flash[:notice] = t :postcard_was_created
      redirect_to(@postcard)
    else
      render :action => "new"
    end
  end

  # PUT /postcards/1
  # PUT /postcards/1.xml
  def update
    @postcard = Postcard.find(params[:id])

    if @postcard.update_attributes(params[:postcard])
      flash[:notice] = t :postcard_was_updated
      redirect_to(@postcard)
    else
      render :action => "edit"
    end
  end

  # DELETE /postcards/1
  # DELETE /postcards/1.xml
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
