class UserMailer < ActionMailer::Base
	before_filter :set_host_from_request, only: [:create]
    default :from => "rezervisemo@gmail.com"

 def registration_confirmation(user)
    @user = user
    mail(:to => "#{user.ime} <#{user.email}>", :subject => "Registration Confirmation")
 end
 
 private
  def set_host_from_request
    ActionMailer::Base.default_url_options = { host: request.host_with_port }
  end
 end