class User < ApplicationRecord
  has_many :products, dependent: :destroy

  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
            format:     { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }

  validates :password, length: { minimum: 6 }, presence: true, allow_nil: true
  has_secure_password

    def product_feed
      Product.where("user_id = ?", id)
    end


    def User.digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
          BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end

    def User.new_token
      SecureRandom.urlsafe_base64
    end

    # Remembers a user in the database for use in persistent sessions.
    def remember
      self.remember_token = User.new_token
      update_attribute(:remember_token, User.digest(remember_token))
    end

    def authenticated?(remember_token)
      return false if remember_token.nil?
      BCrypt::Password.new(remember_token).is_password?(remember_token)
    end

  def forget
    update_attribute(:remember_token, nil)
  end


end
