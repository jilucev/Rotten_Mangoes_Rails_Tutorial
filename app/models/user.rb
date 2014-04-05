class User < ActiveRecord::Base

  has_many :reviews
  has_secure_password

  validates :email,
  presence: true

  validates :password,
  length: { in: 6..20 }, on: :create

  after_create :deliver_signup_email


  def full_name
    "#{firstname} #{lastname}"
  end

  def admin?
    admin == true
  end

  def deliver_signup_email
    @message = AuthMailer.signup_confirmation(self)
    @message.deliver
  end
  #writing a method to display a user's full name. Here, it links to layouts footer
  #and in movies show erb
end
