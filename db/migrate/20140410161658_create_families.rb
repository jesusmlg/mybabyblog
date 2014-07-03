class CreateFamilies < ActiveRecord::Migration
  def change
    create_table :families do |t|
      t.integer :baby_id
      t.integer :parent1
      t.integer :parent2


      t.timestamps
    end
    
    add_index :families , [:baby_id,:parent1,:parent2], unique: true
  end
end
