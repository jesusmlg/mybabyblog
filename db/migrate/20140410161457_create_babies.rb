class CreateBabies < ActiveRecord::Migration
  def change
    create_table :babies do |t|
      t.string :name
      t.date :date
      t.string :description

      t.timestamps
    end
  end
end
