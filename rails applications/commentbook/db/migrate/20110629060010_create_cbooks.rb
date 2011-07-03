class CreateCbooks < ActiveRecord::Migration
  def self.up
    create_table :cbooks do |t|
      t.string :commenter
      t.text :body
      t.string :email
      t.string :website
      t.string :mobile
      t.string :area
      t.integer :pincode

      t.timestamps
    end
  end

  def self.down
    drop_table :cbooks
  end
end
