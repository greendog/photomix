class CollectionsController < ApplicationController
  before_filter :check_public_access
  skip_before_filter :authenticate_user!, :only => [:index, :show]
  add_breadcrumb I18n.t('home_page'), :root_path, :title => I18n.t('home_page')

  def index
    add_breadcrumb t('activerecord.models.collection.popular'), collections_path, :title => t('activerecord.models.collection.popular')
    add_breadcrumb t('activerecord.actions.create', :model => I18n.t('activerecord.models.collection.single')), new_collection_path,
                   :title => t('activerecord.actions.create'), :li_icon => 'icon-plus-sign'
    @collections = Collection.popular.page(@page).per(@per_page)

    respond_to do |format|
      format.html
      format.json  { render :json => @collections }
      format.xml  { render :xml => @collections }
    end
  end
  
  def show
    @collection = Collection.find( params[:id] )
    add_breadcrumb t('activerecord.models.collection.popular'), collections_path, :title => t('activerecord.models.collection.popular')
    add_breadcrumb @collection.title, collection_path(@collection), :title => @collection.title
    add_breadcrumb t('activerecord.actions.update', :model => I18n.t('activerecord.models.collection.single')), edit_collection_path,
                   :title => t('activerecord.actions.update', :model => I18n.t('activerecord.models.collection.single'))
    add_breadcrumb t('activerecord.actions.destroy', :model => I18n.t('activerecord.models.collection.single')),collection_path(@collection),
                   :title => t('activerecord.actions.destroy', :model => I18n.t('activerecord.models.collection.single'))

    @albums = @collection.albums.includes(:photos).where("photos.id NOT NULL").order('albums.rating_average desc').page(@page).per(@per_page)
    respond_to do |format|
      format.html
      format.json  { render :json => @collection }
      format.xml  { render :xml => @collection }
      format.pdf { render :pdf => @collection.title }
    end
  end
    
  def new
    @collection = Collection.new
    add_breadcrumb t('activerecord.models.collection.other').mb_chars.capitalize.to_s, collections_path,
                   :title => t('activerecord.models.collection.other')
    add_breadcrumb t('activerecord.actions.new', :model => I18n.t('activerecord.models.collection.one')), new_collection_path,
                   :title => t('activerecord.actions.new', :model => I18n.t('activerecord.models.collection.one'))
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
    add_breadcrumb t('activerecord.models.collection.popular'), collections_path, :title => t('activerecord.models.collection.popular')
    add_breadcrumb t('activerecord.actions.create', :model => I18n.t('activerecord.models.collection.single')), new_collection_path, :title => t('activerecord.actions.create')
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
