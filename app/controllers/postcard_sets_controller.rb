class PostcardSetsController < ApplicationController

  POSTCARD_SET_IDS_KEY = :postcard_set_ids

  def index
    @postcard_sets = PostcardSet.search(params)
  end

  def new
    @postcard_set = PostcardSet.new
    init_elements_from_session
  end

  def create
    @postcard_set = PostcardSet.new(params[:postcard_set])

    if @postcard_set.save
      flash[:notice] = t :postcard_set_was_created
      redirect_to(@postcard_set)
    else
      render action: 'new'
    end
  end

  def edit
    @postcard_set = PostcardSet.find(params[:id])
  end

  def update
    @postcard_set = PostcardSet.find(params[:id])

    if @postcard_set.update_attributes(params[:postcard_set])
      flash[:notice] = t :postcard_set_was_updated
      redirect_to(@postcard_set)
    else
      render action: 'edit'
    end
  end

  def destroy
    @postcard_set = PostcardSet.find(params[:id])
    @postcard_set.destroy

    redirect_to(postcard_sets_url)
  end

  def show
    @postcard_set = PostcardSet.find(params[:id])
  end

  # ajax requests

  def add_to_set
    postcard_set_ids = session[POSTCARD_SET_IDS_KEY] || session[POSTCARD_SET_IDS_KEY] = []
    if params[:include_in_set] =~ /^true$/i
      postcard_set_ids << params[:postcard_id].to_i
    else
      postcard_set_ids.delete(params[:postcard_id].to_i)
    end
    render json: postcard_set_ids.size
  end

  def current_set
    render json: session[POSTCARD_SET_IDS_KEY] || []
  end

  private 

  def init_elements_from_session
    session[POSTCARD_SET_IDS_KEY].each_with_index do |postcard_id, i|
      postcard = Postcard.find(postcard_id)
      element = @postcard_set.postcard_set_elements.build(order_number: i)
      element.postcard = postcard
    end
    session[POSTCARD_SET_IDS_KEY].clear
  end

end
