class CreateGames < ActiveRecord::Migration
  def self.up
    create_table :games do |t|
t.column :title, :string, :limit => 32, :null => false
	t.column :price, :float
	t.column :game_id, :integer

      t.timestamps
    end
  end

  def self.down
    drop_table :games
  end
end
