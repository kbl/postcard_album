class PostcardsController < ApplicationController
  # GET /postcards
  # GET /postcards.xml
  def index
    @postcards = Postcard.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @postcards }
    end
  end

  # GET /postcards/1
  # GET /postcards/1.xml
  def show
    @postcard = Postcard.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @postcard }
    end
  end

  # GET /postcards/new
  # GET /postcards/new.xml
  def new
    @postcard = Postcard.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @postcard }
    end
  end

  # GET /postcards/1/edit
  def edit
    @postcard = Postcard.find(params[:id])
  end

  # POST /postcards
  # POST /postcards.xml
  def create
    @postcard = Postcard.new(params[:postcard])

    respond_to do |format|
      if @postcard.save
        flash[:notice] = 'Postcard was successfully created.'
        format.html { redirect_to(@postcard) }
        format.xml  { render :xml => @postcard, :status => :created, :location => @postcard }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @postcard.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /postcards/1
  # PUT /postcards/1.xml
  def update
    @postcard = Postcard.find(params[:id])

    respond_to do |format|
      if @postcard.update_attributes(params[:postcard])
        flash[:notice] = 'Postcard was successfully updated.'
        format.html { redirect_to(@postcard) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @postcard.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /postcards/1
  # DELETE /postcards/1.xml
  def destroy
    @postcard = Postcard.find(params[:id])
    @postcard.destroy

    respond_to do |format|
      format.html { redirect_to(postcards_url) }
      format.xml  { head :ok }
    end
  end
end
