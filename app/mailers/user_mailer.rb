class UserMailer < ApplicationMailer

  default from: 'notifications@rotten_mangoes.com'

  def deletion_email(user)
    @user = user
    mail(to: @user.email, subject: 'Account Deleted from Rotten Mangoes')
  end

end
