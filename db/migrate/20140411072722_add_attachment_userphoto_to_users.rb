class AddAttachmentUserphotoToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.attachment :userphoto
    end
  end

  def self.down
    drop_attached_file :users, :userphoto
  end
end
