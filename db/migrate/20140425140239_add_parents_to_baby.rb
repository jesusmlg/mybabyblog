class AddParentsToBaby < ActiveRecord::Migration
  def change
    add_column :babies, :parent1_name, :string
    add_column :babies, :parent2_name, :string
    add_column :babies, :how_we_met, :string
    add_column :babies, :parent1_desc, :string
    add_column :babies, :parent2_desc, :string
  end
end
