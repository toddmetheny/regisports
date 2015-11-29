# Load the Rails application.
require File.expand_path('../application', __FILE__)


ActionMailer::Base.smtp_settings = {
  :user_name => ENV["send_grid_user_name"],
  :password => ENV["send_grid_password"],
  :domain => 'regisports.herokuapp.com',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}
# Initialize the Rails application.
Rails.application.initialize!
