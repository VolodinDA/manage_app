class User < ApplicationRecord
	before_save { email.downcase! }
	before_create :create_remember_token
	validates :name, presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX=/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false}
	validates :password, length: { minimum: 6 }
	has_secure_password

	belongs_to :errand, foreign_key: "errand_id", optional: true

	belongs_to :department, foreign_key: "department_id", optional: true

	has_many :speeches, foreign_key: "user_id", dependent: :destroy
	has_many :languages, through: :speeches, source: :language

	has_many :characteristics, foreign_key: "user_id", dependent: :destroy
	has_many :abilities, through: :characteristics, source: :ability

	has_many :merits, foreign_key: "user_id", dependent: :destroy
	has_many :rewards, through: :merits, source: :reward

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

	def new_langs
		knowed_langs=self.language_ids
		Language.where("id NOT IN (?)", knowed_langs)
	end

	def new_rewards
		knowed_rewards=self.reward_ids
		if knowed_rewards.blank?
			knowed_rewards=[0]
		end
		Reward.where("id NOT IN (?)", knowed_rewards)
	end

	def new_abilities
		knowed_abilities=self.ability_ids
		if knowed_abilities.blank?
			knowed_abilities=[0]
		end
		Ability.where("id NOT IN (?)", knowed_abilities)
	end

	def new_errands
		Errand.where("is_finished=(?)", false)
	end

	private
	
	def create_remember_token
		self.remember_token=User.encrypt(User.new_remember_token)
	end
end
