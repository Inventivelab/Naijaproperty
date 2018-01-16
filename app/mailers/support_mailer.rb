class SupportMailer < ActionMailer::Base
    default to: 'saydmaadan@gmail.com'
  
    def support_email(name, email, subject, body)
      @name = name
      @email = email
      @subject = subject
      @body = body
  
      mail(from: email, subject: 'Support form Message')
    end
  
  end