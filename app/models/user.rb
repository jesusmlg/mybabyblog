class User < ActiveRecord::Base
	before_save { self.email = self.email.downcase }

  def to_param
  	nick
	end

	has_secure_password
	has_many :articles
	#belongs_to :articles

	validates :name , presence: true, length: { maximum: 255 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }
	validates :nick, presence: true , uniqueness: { case_sensitive: false }, length: { maximum: 255 }

	validates :password, length:{minimum: 6, maximum: 255}
	do_not_validate_attachment_file_type :userphoto
	has_attached_file :userphoto, :styles => { :thumb => "100x100>", :avatar => "25x25" },
  					 :storage => :dropbox,
                     :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
                     :dropbox_options => {},
                     :dropbox_visibility => 'public',
                     :path => "#{Mybaby::DROPBOXDIR}/user/:style/:id/:filename"	
end
