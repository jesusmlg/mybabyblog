class AddUserIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :articles_id, :integer
  end
end
