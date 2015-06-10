class AddSectionNotNullIdToArticle < ActiveRecord::Migration
  def change
    change_column_null :articles, :name, false
    change_column_null :articles, :price, false
    change_column_null :articles, :expiry_date, false
    change_column_null :articles, :section_id, false
  end
end
