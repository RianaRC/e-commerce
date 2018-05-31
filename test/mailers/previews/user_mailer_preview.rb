# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def mail_preview
    UserMailer.welcome_email().deliver_now
  end
  def order_email
  	UserMailer.order_email(User.first)
  end
end
