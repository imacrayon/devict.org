class UpdateVideos < ActiveRecord::Migration
  def up
    add_column :videos, :ytID, :string
    add_column :videos, :author, :string
    remove_column :videos, :content
    remove_column :videos, :link
    remove_column :videos, :guid
  end

  def down
    remove_column :videos, :ytID
    remove_column :videos, :author
    add_column :videos, :content, :text
    add_column :videos, :link, :text
    add_column :videos, :guid, :text
  end
end
