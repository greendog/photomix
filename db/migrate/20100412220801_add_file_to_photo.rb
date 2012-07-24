class AddFileToPhoto < ActiveRecord::Migration
  def self.up
    add_column :photos, :attachment, :string
  end

  def self.down
    remove_column :photos, :attachment
  end
end
