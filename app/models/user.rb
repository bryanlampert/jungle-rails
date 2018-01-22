class User < ActiveRecord::Base

  has_secure_password

  has_many :reviews, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  def authenticate_with_credentials(email, password)
    @email = email.strip
    @password = password
    User.new(email: @email, password: @password)
  end

end
