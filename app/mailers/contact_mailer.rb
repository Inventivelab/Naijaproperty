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
          subject: "You have a new message from #{@user.first_name}")
    end

    def send_autoreply_to_user(email)
      @email = email
      mail(to: @email,
           from: "noreply@naijaproperty.com",
           subject: "Support @NaijaProperty")
    end
  end
