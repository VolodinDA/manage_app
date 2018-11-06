class User < ApplicationRecord
	before_save { email.downcase! }
	before_create :create_remember_token
	validates :name, presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX=/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false}
	validates :password, length: { minimum: 6 }
	has_secure_password

	has_many :speeches, foreign_key: "user_id"
	has_many :languages, through: :speeches, source: :language

	# Creating a remember_token to remember the user #
	
	def User.new_remember_token
		SecureRandom.urlsafe_base64
	end
	
	def User.encrypt(token)
		Digest::SHA1.hexdigest(token.to_s)
	end

	def learn_language!(new_language)
		speeches.create!(language_id: new_language.id)
	end

	def forget_language!(language)
		speeches.find_by(language_id: language.id).destroy!
	end

	def lang_feed
		self.languages.map(&:name)
		#Language.learned_by(self)
	end
	
	def reward_feed
		name
	end
	
	private
	
	def create_remember_token
		self.remember_token=User.encrypt(User.new_remember_token)
	end
end
