class User < ActiveRecord::Base

  has_many :reviews
  has_secure_password

  def full_name
    "#{firstname} #{lastname}"
  end

  #writing a method to display a user's full name. Here, it links to layouts footer
  #and in movies show erb
end
