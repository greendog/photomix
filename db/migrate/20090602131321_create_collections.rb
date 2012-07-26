class CreateCollections < ActiveRecord::Migration
  def self.up
    create_table :collections do |t|
      t.string :title, :null => false
      t.string :description
      t.decimal :rating_average, :default => 0, :precision => 6, :scale => 2
      t.string :url
      t.boolean :public, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :collections
  end
end
