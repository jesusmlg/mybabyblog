class AddBabyIdToGifts < ActiveRecord::Migration
  def change
    add_column :gifts, :baby_id, :integer
  end
end
