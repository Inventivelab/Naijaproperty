class ContactMailer < ApplicationMailer

    def contact_created(user, email, first_name, last_name, phone, message)
      @user = user
      @email = email
      @first_name = first_name
      @last_name = last_name
      @phone = phone
      @message = message
  
      mail(to: @user.email,
          from: @email,
          subject: "Contact from user to check for Listing Availability")
    end
  
    def send_autoreply_to_user(email)
      @email = email
      mail(to: @email, subject: "Thanks for contacting us, we'll get back to you! 😘 💋")
    end
  end
  