class AvailabilityMailer < ApplicationMailer

  # def availability_created(availability)
  #   @availability = availability
    

  #   mail(to: @availability.user.email,
  #       from: "sales@naijaproperty.com",
  #       subject: "Contact from user to check for Listing Availability")
  # end

  def availability_created(listing, user, email, first_name, last_name, phone, start_date, end_date, message)
    @listing = listing
    @listing.user = user
    @email = email
    @first_name = first_name
    @last_name = last_name
    @phone = phone
    @start_date = start_date
    @end_date = end_date
    @message = message

    mail(to: @listing.user.email,
        from: "sales@naijaproperty.com",
        subject: "Contact from user to check for Listing Availability")
  end

  def send_autoreply_to_user(email, listing)
    @email = email
    @listing = listing
    mail(to: @email, subject: "Thanks for contacting us, we'll get back to you! 😘 💋")
  end
end
