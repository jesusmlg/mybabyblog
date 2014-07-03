class AddAttachmentParent1PhotoParent2PhotoToBabies < ActiveRecord::Migration
  def self.up
    change_table :babies do |t|
      t.attachment :parent1_photo
      t.attachment :parent2_photo
    end
  end

  def self.down
    drop_attached_file :babies, :parent1_photo
    drop_attached_file :babies, :parent2_photo
  end
end
