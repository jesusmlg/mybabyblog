class AddParentsToBabies < ActiveRecord::Migration
  def change
    add_column :babies, :parent1, :integer
    add_column :babies, :parent2, :integer
  end
end
