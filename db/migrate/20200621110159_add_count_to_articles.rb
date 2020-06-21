class AddCountToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :count, :integer
  end
end
