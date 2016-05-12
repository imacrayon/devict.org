class UpdateVideos < ActiveRecord::Migration
  def change
    add_column :videos, :ytID, :string
    add_column :videos, :author, :string
    remove_column :videos, :content, :text
    remove_column :videos, :link, :text
    remove_column :videos, :guid, :text
  end
end
