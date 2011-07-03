class CreateMessages < ActiveRecord::Migration
  def self.up
    create_table :messages do |t|
      t.string :name
      t.text :message
      t.string :email
      t.string :sender
      t.date :date

      t.timestamps
    end
  end

  def self.down
    drop_table :messages
  end
end
