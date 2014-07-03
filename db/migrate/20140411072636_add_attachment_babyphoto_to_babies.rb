class AddAttachmentBabyphotoToBabies < ActiveRecord::Migration
  def self.up
    change_table :babies do |t|
      t.attachment :babyphoto
    end
  end

  def self.down
    drop_attached_file :babies, :babyphoto
  end
end
