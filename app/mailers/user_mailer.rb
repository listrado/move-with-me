class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  default from: 'movewithmerio@gmail.com'

  #   en.user_mailer.welcome.subject
  #
  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to Movewithme')
  end
end
