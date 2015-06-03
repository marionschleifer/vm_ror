class CreateTurnTables < ActiveRecord::Migration
  def change
    create_table :turn_tables do |t|
      t.boolean :open
      t.integer :machine_id

      t.timestamps null: false
    end
  end
end
