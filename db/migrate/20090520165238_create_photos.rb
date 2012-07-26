class CreatePhotos < ActiveRecord::Migration
  def self.up
    create_table :photos do |t|
      t.string :title, :length => 250
      t.text :description
      t.references :album
      t.decimal :rating_average, :default => 0, :precision => 6, :scale => 2
      t.string :url
      t.boolean :public

      t.timestamps
    end
  end

  def self.down
    drop_table :photos
  end
end
