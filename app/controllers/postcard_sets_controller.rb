class PostcardSetsController < ApplicationController

  POSTCARD_SET_IDS_KEY = :postcard_set_ids

  def add_to_set
    postcard_set_ids = session[POSTCARD_SET_IDS_KEY] || session[POSTCARD_SET_IDS_KEY] = []
    if params[:include_in_set] =~ /^true$/i
      postcard_set_ids << params[:postcard_id].to_i
    else
      postcard_set_ids.delete(params[:postcard_id].to_i)
    end
    p session[POSTCARD_SET_IDS_KEY]
    render nothing: true
  end

  def current_set
    render json: session[POSTCARD_SET_IDS_KEY] || []
  end

end
