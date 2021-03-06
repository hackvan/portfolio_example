class User < ApplicationRecord
  before_save { username.downcase! }

  validates :username, presence: true,
                       length:   { maximum: 50 }

  has_secure_password
  validates :password, presence: true,
                       allow_nil: true,
                       length: { minimum: 6 }

  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

end
