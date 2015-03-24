class User < ActiveRecord::Base
	def to_param
  	nick
	end

	has_secure_password
	has_many :articles
	#belongs_to :articles

	validates :name , presence: true
	validates :email, presence: true, uniqueness: true
	validates :nick, presence: true , uniqueness: true

	validates :password, length:{minimum: 6}
	do_not_validate_attachment_file_type :userphoto
	has_attached_file :userphoto, :styles => { :thumb => "100x100>", :avatar => "25x25" },
  					 :storage => :dropbox,
                     :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
                     :dropbox_options => {},
                     :dropbox_visibility => 'public',
                     :path => "#{Mybaby::DROPBOXDIR}/user/:style/:id/:filename"	
end
