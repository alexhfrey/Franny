ActionMailer::Base.smtp_settings = {
  :address        => 'smtp.sendgrid.net',
  :port           => '587',
  :authentication => :plain,
  :user_name      => 'franny',
  :password       => '8Chickens',
  :domain         => 'heroku.com'
}
ActionMailer::Base.delivery_method = :smtp