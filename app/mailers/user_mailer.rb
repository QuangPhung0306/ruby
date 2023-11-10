class UserMailer < ApplicationMailer
  def send_changed_password password, user_email, agency_name, sender_id, receiver_id, web_address
    @password = password
    @user_email = user_email
    @agency_name = agency_name
    @web_address = web_address
    content = I18n.t(".user_mailer.send_changed_password.email_content", 
      password: password, user_email: user_email, agency_name: agency_name, web_address: @web_address)
    EmailHistory.create content: content, 
      sender_id: sender_id, receiver_id: receiver_id
    mail to: user_email, subject: t(".reset_password_subject")
  end

  def send_email_to_users agency_name, email, content, sender_id, receiver_id, web_address
    @content = content
    @agency_name = agency_name
    @web_address = web_address
    content_history = I18n.t(".user_mailer.send_email_to_users.email_content", 
      agency_name: agency_name, content: content, web_address: @web_address)
    EmailHistory.create content: content_history,
      sender_id: sender_id, receiver_id: receiver_id
    mail to: email, subject: t(".send_email_notification_subject")
  end

  def send_email_after_register_agency agency_name, email, password, sender_id, receiver_id, web_address
    @agency_name = agency_name
    @web_address = web_address
    @email = email
    @password = password
    content = I18n.t(".user_mailer.send_email_after_register_agency.email_content", 
      agency_name: agency_name, user_email: email, password: password, web_address: @web_address)
    EmailHistory.create content: content,
      sender_id: sender_id, receiver_id: receiver_id
    mail to: @email, subject: t(".successful_registration_notification")
  end
end
