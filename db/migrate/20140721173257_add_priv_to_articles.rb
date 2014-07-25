class AddPrivToArticles < ActiveRecord::Migration
  def change
  	add_column :articles, :priv , :boolean, default: false
  end
end

