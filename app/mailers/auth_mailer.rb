class AuthMailer < ActionMailer::Base
  default from: "from@example.com"

  def signup_confirmation(user)
    @user = user
    mail to: @user.email, subject: "Welcome aboard!"
  end
end
