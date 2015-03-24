class Image < ActiveRecord::Base
  do_not_validate_attachment_file_type :newimg
   has_attached_file :newimg, :styles => { :high => "900x900", :medium => "650x650>", :thumb => "125x125>" },
  					         :storage => :dropbox,
                     :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
                     :dropbox_visibility => 'public',
                     :path => "#{Mybaby::DROPBOXDIR}/new/:style/:id_:filename",
                     :dropbox_options => {}
                     
  

  belongs_to :article

  def myDate
		created_at.strftime("%d/%m/%Y")
	end
end
