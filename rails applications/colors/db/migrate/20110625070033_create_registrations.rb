class CreateRegistrations < ActiveRecord::Migration
  def self.up
    create_table :registrations do |t|
      t.string :name
      t.integer :age
      t.text :address

      t.timestamps
    end
  end

  def self.down
    drop_table :registrations
  end
end
