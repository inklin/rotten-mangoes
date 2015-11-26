class UserMailer < ActionMailer::Base
  default from: "from@rottenmangoesuser.com"

  def goodbye_email(user)
    @user = user
    mail(to: @user.email, subject: "Goodbye from Rotten Mangoes")
  end
end
