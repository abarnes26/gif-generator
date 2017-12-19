class User < ApplicationRecord
  has_secure_password
  has_many :favorites

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

  enum role: ["default", "admin"]

  def self.authenticate(email, password)
    user = User.find_by(email: email)
    if user.password == password
      flash[:success] = "Welcome Back!"
      redirect_to user_path(user)
    else
      flash[:failure] = "Sorry, your email or password was incorrect"
      redirect_to "./login"
    end
  end
end
