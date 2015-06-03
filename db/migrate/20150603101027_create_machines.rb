class CreateMachines < ActiveRecord::Migration
  def change
    create_table :machines do |t|
      t.string :name
      t.integer :positions
      t.integer :current_position

      t.timestamps null: false
    end
  end
end
