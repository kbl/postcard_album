class PublishersController < ApplicationController

  before_filter :set_navigation

  def index
    @publishers = Publisher.search(params)
  end

  def show
    @publisher = Publisher.find(params[:id])
  end

  def new
    @publisher = Publisher.new
  end

  def edit
    @publisher = Publisher.find(params[:id])
  end

  def create
    @publisher = Publisher.new(params[:publisher])

    if @publisher.save
      redirect_to(@publisher, :notice => t(:publisher_was_created))
    else
      render :action => "new"
    end
  end

  def update
    @publisher = Publisher.find(params[:id])

    if @publisher.update_attributes(params[:publisher])
      redirect_to(@publisher, :notice => t(:publisher_was_updated))
    else
      render :action => "edit"
    end
  end

  def destroy
    @publisher = Publisher.find(params[:id])
    @publisher.destroy

    redirect_to(publishers_url)
  end


  private

  def set_navigation
    # TODO Rails3
    # current_navigation :publishers
  end

end
