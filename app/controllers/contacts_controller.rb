class ContactsController < ApplicationController
    def create
        @user = User.friendly.find(params[:user_id])
    
        @contact = Contact.new(contact_params)
        @contact.user_id = @user.id
        if @contact.save
          first_name = params[:contact][:first_name]
          last_name = params[:contact][:last_name]
          email = params[:contact][:email]
          phone = params[:contact][:phone]
          message = params[:contact][:message]
    
          ContactMailer.contact_created(@user, @contact.email, @contact.first_name, @contact.last_name, @contact.phone, @contact.message).deliver
          flash[:notice] = "Thanks for reaching out. Your message sent succefully, We'll get back too you as soon as possible"
          redirect_to @user
        else
          flash[:alert] = 'Error occured, message could not be sent.'
          redirect_to @user
        end
      end
    
    private

        def contact_params
          params.require(:contact).permit(:email, :first_name, :last_name, :phone, :message)
        end
end
