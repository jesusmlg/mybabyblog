class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :nick
      t.string :email
      t.date :date
      t.string :description

      t.timestamps
    end
  end
end
