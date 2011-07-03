class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.string :Name
      t.integer :Age
      t.string :Mobile
      t.string :e_mail
      t.text :hobbies
      t.text :address

      t.timestamps
    end
  end

  def self.down
    drop_table :pages
  end
end
