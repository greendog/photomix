class CreateAlbum < ActiveRecord::Migration
  def self.up
    create_table :albums do |t|
      t.string :title, :length => 250, :null => false
      t.text :description
      t.decimal :rating_average, :default => 0, :precision => 6, :scale => 2
      t.string :url
      t.boolean :public

      t.timestamps
    end
  end

  def self.down
    drop_table :albums
  end
end
