ActionMailer::Base.smtp_settings = {
  :address        => 'smtp.sendgrid.net',
  :port           => '587',
  :authentication => :plain,
  :user_name      => 'frannyskitchen',
  :password       => '100chickens',
  :domain         => 'heroku.com'
}
ActionMailer::Base.delivery_method = :smtp