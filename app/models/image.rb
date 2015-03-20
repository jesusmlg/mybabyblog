class Image < ActiveRecord::Base
  do_not_validate_attachment_file_type :newimg
  has_attached_file :newimg, :styles => { :high => "1024x104", :medium => "600x600>", :thumb => "250x250>" }#,
  					# :storage => :dropbox,
       #              :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
       #              :dropbox_options => {},
       #              :path => "new/:style/:id_:filename"
  

  belongs_to :article

  def myDate
		created_at.strftime("%d/%m/%Y")
	end
end
