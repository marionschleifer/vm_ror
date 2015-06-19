class AddSoldToArticles < ActiveRecord::Migration
  def up
    add_column :articles, :sold, :boolean, default: false
    change_column :articles, :section_id, :integer, null: :true
  end

  def down
    remove_column :articles, :sold
    change_column :articles, :section_id, :integer, null: :false
  end
end
