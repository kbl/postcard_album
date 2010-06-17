class IndexController < ApplicationController

  def index
    @postcard = Postcard.find(:last)
    @newest_postcards = Postcard.horizontal.limited(5)
  end

end
