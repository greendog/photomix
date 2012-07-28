class Collection < ActiveRecord::Base
  extend Ext::GroupFor

  ajaxful_rateable :stars => 5, :cache_column => :rating_average

  has_many :collection_albums
  has_many :albums, :through => :collection_albums
  attr_accessor :album_list

  validates :title, :presence => true

  scope :visible, where(:public => true)
  scope :popular, lambda{visible.includes(:albums => :photos).where("photos.id NOT NULL").order('collections.rating_average desc')}

  def photos_count
     self.albums.includes(:photos).size
  end

  def to_param
     "#{id}-#{title.parameterize}"
  end
  
  def album_list=(albums)
    self.albums = Album.find(albums.map{|album|album[0]})
  end

end