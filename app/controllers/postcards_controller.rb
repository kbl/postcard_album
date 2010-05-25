class PostcardsController < ApplicationController

  # GET /postcards
  # GET /postcards.xml
  def index
    @postcards = Postcard.find_all_paginated(params[:page])
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
      flash[:notice] = 'Postcard was successfully created.'
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
      flash[:notice] = ' was successfully updated.'
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

end
