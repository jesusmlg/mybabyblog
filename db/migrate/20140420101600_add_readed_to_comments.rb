class AddReadedToComments < ActiveRecord::Migration
  def change
    add_column :comments, :readed, :boolean, default: false
    
  end
end
