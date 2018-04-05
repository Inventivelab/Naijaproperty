# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!
# ActionMailer::Base.smtp_settings = {
#   :user_name => ENV["sendgrid_username"],
#   :password => ENV["sendgrid_password"],
#   :domain => 'naijaproperty.herokuapp.com',
#   :address => 'smtp.sendgrid.net',
#   :port => 587,
#   :authentication => :plain,
#   :enable_starttls_auto => true
# }
#
# config.paperclip_defaults = {
#   storage: :s3,
#   path: ':class/:attachment/:id/:style/:filename',
#   s3_host_name: ENV["aws_host_name"],
#   s3_credentials: {
#     bucket: ENV["s3_bucket_name"],
#     access_key_id: ENV["aws_access_key_id"],
#     secret_access_key: ENV["aws_secret_access_key"],
#     s3_region:ENV["aws_region"]
#   }
# }
