class User < ApplicationRecord
  has_secure_password

  before_validation :strip_whitespace, :only => [:email]
  before_validation :lower_case, :only => [:email]


  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email' }
  validates :password, presence: true
  validates :password, length: {minimum: 3}
  validates :password_confirmation, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  def self.authenticate_with_credentials(email, password)
    user = User.find_by(email: email)
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end

  private
  def strip_whitespace
    self.email = self.email.strip unless self.email.nil?
  end

  def lower_case
    self.email = self.email.downcase unless self.email.nil?
  end
end