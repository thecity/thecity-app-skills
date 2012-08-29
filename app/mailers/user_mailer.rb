class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def you_have_mail(user, message)
debugger
asdf=234
    
    @user_name = user.full_name
    @message = message
    mail(:to => Rails.env == 'production' ? user.email : DEVELOPER_EMAIL, :subject => "You've Got Mail!")
  end  
end
