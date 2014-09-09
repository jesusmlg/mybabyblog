class CreateGifts < ActiveRecord::Migration
  def change
    create_table :gifts do |t|
      t.string :name
      t.string :person
      t.boolean :checked

      t.timestamps
    end
  end
end
