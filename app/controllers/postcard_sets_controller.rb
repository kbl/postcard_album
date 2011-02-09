class PostcardSetsController < ApplicationController

  before_filter :set_navigation

  def new
    @postcard_set = PostcardSet.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def delete
  end

  private

  def set_navigation
    # TODO Rails3
    # current_navigation :postcard_sets    
  end

end
