class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
 def welcome(user)
    @user = user  # Instance variable => available in view

    mail(to: @user.email, subject: 'Welcome to EduCrew')
    # This will render a view in `app/views/user_mailer`!
  end

   def become_tutor_confirmation(tutor)
    @user = tutor

    mail(
      to:       @user.email,
      subject:  "Hi #{@user.name}, only one last step to become a tutor!"
    )
  end
end
