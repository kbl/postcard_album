class ImagesController < ApplicationController
  
  def show
    render :status => :forbidden and return if params[:style] =~ /original/
    
    path = Image.find(params[:id]).image.path(params[:style])

    send_file(path, :type => 'image/jpeg')
  end

end
