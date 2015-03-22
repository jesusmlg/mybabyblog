class Image < ActiveRecord::Base
  do_not_validate_attachment_file_type :newimg
  has_attached_file :newimg, :styles => { :high => "1024x1024", :medium => "650x650>", :thumb => "150x150>" },
  					 :storage => :dropbox,
                     :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
                     :dropbox_options => {},
                     :path => "new/:style/:id_:filename"
  

  belongs_to :article

  def myDate
		created_at.strftime("%d/%m/%Y")
	end
end
