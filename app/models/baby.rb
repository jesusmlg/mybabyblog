class Baby < ActiveRecord::Base
	validates :name, presence: true
	validates :nick, presence: true, uniqueness: true

	has_secure_password

	belongs_to :users
	has_many :gifts

	validates :password, length:{minimum: 6}, :if => lambda{ new_record? || !password.nil? }

	do_not_validate_attachment_file_type :babyphoto
	has_attached_file :babyphoto, :styles => { 	:high => "500x500", 
												:medium => "250x250", 
												:thumb => "100x100>" },
					:storage => :dropbox,
                    :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
                    :dropbox_options => {},
                    :path => "baby/:style/:id_:filename"

	has_attached_file :parent1_photo, :styles => { :high => "250x250",  :thumb => "100x100>" },
					:storage => :dropbox,
                    :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
                    :dropbox_options => {},
                    :path => "parent1/:style/:id_:filename"
	
	has_attached_file :parent2_photo, :styles => { :high => "250x250", :thumb => "100x100>" },
					:storage => :dropbox,
                    :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
                    :dropbox_options => {},
                    :path => "parent2/:style/:id_:filename"
end
