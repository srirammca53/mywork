class ChangeFieldnameToTablename < ActiveRecord::Migration
  def self.up
add_column :posts, :password, :string

  end

  def self.down
remove_column :posts, :password

  end
end
