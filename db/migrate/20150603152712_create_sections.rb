class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.boolean :empty
      t.integer :turn_table_id

      t.timestamps null: false
    end
  end
end
