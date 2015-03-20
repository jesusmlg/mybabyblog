class CreateParameters < ActiveRecord::Migration
  def change
    create_table :parameters do |t|
      t.string :comments_pass

      t.timestamps
    end
  end
end
