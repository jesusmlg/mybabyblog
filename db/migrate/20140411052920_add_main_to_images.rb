class AddMainToImages < ActiveRecord::Migration
  def change
  	change_table :images do |t|
      t.boolean :main
    end

  end
end
