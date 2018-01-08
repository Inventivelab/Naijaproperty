class AvailabilityMailer < ApplicationMailer

  def availability_created(current_user, email, first_name, last_name, phone, start_date, end_date, message)
    @current_user = current_user
    @email = email
    @first_name = first_name
    @last_name = last_name
    @phone = phone
    @start_date = start_date
    @end_date = end_date
    @message = message

    mail(to: current_user.email,
        from: "sales@naijaproperty.com",
        subject: "Contact from user to check for Listing Availability")
  end
end
