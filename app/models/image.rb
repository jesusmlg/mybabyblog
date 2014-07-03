class Image < ActiveRecord::Base
  do_not_validate_attachment_file_type :newimg
  has_attached_file :newimg, :styles => { :high => "500x500", :medium => "300x300>", :thumb => "100x100>" }
  

  belongs_to :article

  def mydate
		created_at.strftime("%d/%m/%Y")
	end
end
