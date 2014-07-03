class AddBabyIdToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :baby_id, :integer
  end
end
