class Baby < ActiveRecord::Base
	validates :name, presence: true
	validates :nick, presence: true, uniqueness: true

	has_secure_password

	belongs_to :users

	validates :password, length:{minimum: 6}, :if => lambda{ new_record? || !password.nil? }

	do_not_validate_attachment_file_type :babyphoto
	has_attached_file :babyphoto, :styles => { :high => "500x500", :medium => "250x250", :thumb => "100x100>" }
	has_attached_file :parent1_photo, :styles => { :high => "250x250",  :thumb => "100x100>" }
	has_attached_file :parent2_photo, :styles => { :high => "250x250", :thumb => "100x100>" }
end
