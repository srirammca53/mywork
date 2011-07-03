class AddPageviewsToComment < ActiveRecord::Migration
  def self.up
    add_column :comments, :page_views, :integer
  end

  def self.down
    remove_column :comments, :page_views
  end
end
