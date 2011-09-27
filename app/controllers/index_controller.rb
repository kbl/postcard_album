class IndexController < ApplicationController

  def index
    @newest_postcards = Postcard.most_interesting.limited(10)
  end

end
