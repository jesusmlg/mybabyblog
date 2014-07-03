class AddAttachmentNewimgToImages < ActiveRecord::Migration
  def self.up
    change_table :images do |t|
      t.attachment :newimg
    end
  end

  def self.down
    drop_attached_file :images, :newimg
  end
end
