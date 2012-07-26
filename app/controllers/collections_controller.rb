class CollectionsController < ApplicationController
  before_filter :check_public_access
  skip_before_filter :authenticate_user!, :only => [:index, :show]


  def index
    @collections = Collection.includes(:albums => :photos).where("photos.id NOT NULL").group_for.order('collections.title')
    @popular_photos = Photo.visible.order('rating_average asc').limit(10)

    respond_to do |format|
      format.html
      format.json  { render :json => @collections }
      format.xml  { render :xml => @collections }
    end
  end
  
  def show
    @collection = Collection.find( params[:id] )
    @albums = @collection.albums.order('title')
    respond_to do |format|
      format.html
      format.json  { render :json => @collection }
      format.xml  { render :xml => @collection }
      format.pdf { render :pdf => @collection.title }
    end
  end
    
  def new
    @collection = Collection.new
  end

  def create
    @collection = Collection.new(params[:collection])
    if @collection.save
      flash[:notice] = "Collection created! Now lets add a new album."
      redirect_to new_collection_album_path(@collection)
    else
      render :action => :new
    end
  end
  
  def edit
    @collection = Collection.find( params[:id])
  end

  def update
    @collection = Collection.find( params[:id])
    if @collection.update_attributes(params[:collection])
      flash[:notice] = "Collection updated!"
      redirect_to @collection
    else
      render :action => :edit
    end
  end
  
  def destroy
    @collection = Collection.find( params[:id])
    if @collection.destroy
      redirect_to collections_path
    else
      redirect_to @collection
    end
  end

  def rate
    @collection = Collection.find(params[:id])
    @collection.rate(params[:stars], current_user, params[:dimension])
    render :json => {:id => @collection.wrapper_dom_id(params), :width => 125}
  end
  
end
