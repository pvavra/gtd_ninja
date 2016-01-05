class User < ActiveRecord::Base
	before_save { email.downcase! }
	validates :name, presence: true, length: { maximum: 50}
	# based on: https://davidcel.is/posts/stop-validating-email-addresses-with-regex/
	# could be simply: VALID_EMAIL_REGEX = /@/
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
										uniqueness: { case_sensitive: false }
										validates :password, length: { minimum: 6 }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
end
