class SupportsController < ApplicationController
    def new
        @support = Support.new
      end
    
      def create
        @support = Support.new(support_params)
        if @support.save
          name = params[:support][:name]
          email = params[:support][:email]
          subject = params[:support][:subject]
          body = params[:support][:message]
    
          SupportMailer.support_email(name, email, subject, body).deliver
          flash[:notice] = "Thanks for reaching out. Your message sent succefully, We'll get back too you as soon as possible"
          redirect_to support_path
        else
          flash[:alert] = 'Error occured, message could not be sent.'
          redirect_to support_path
        end
      end
    
      private
    
      def support_params
        params.require(:support).permit(:name, :email, :subject, :message)
      end
end
