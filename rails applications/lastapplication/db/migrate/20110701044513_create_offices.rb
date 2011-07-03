class CreateOffices < ActiveRecord::Migration
  def self.up
    create_table :offices do |t|
      t.string :emp_name
      t.integer :emp_age
      t.integer :emp_salary
      t.integer :emp_experience

      t.timestamps
    end
  end

  def self.down
    drop_table :offices
  end
end
