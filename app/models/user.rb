class User < ActiveRecord::Base

  # Define attributes here
  attr_accessible :auth_token, :email, :first_name, :last_login, :last_name, :login_count,
                :password, :password_confirmation, :password_reset_sent_at, :password_reset_token

  # Define associated things here
  has_secure_password

  # Define Validations here
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, on: :create

  # Define Association here
  has_many :albums, dependent: :destroy

  # Instance Methods
  def sign_in
    increment! :login_count
    touch :last_login
  end

end
