class User < ActiveRecord::Base
	def to_param
  		nick
	end

	has_secure_password
	has_many :article
	#belongs_to :articles
	has_one :article

	validates :name , presence: true
	validates :email, presence: true, uniqueness: true
	validates :nick, presence: true , uniqueness: true

	validates :password, length:{minimum: 6}
	do_not_validate_attachment_file_type :userphoto
	has_attached_file :userphoto, :styles => { :thumb => "100x100>" }	
end
