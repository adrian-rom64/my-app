ActionMailer::Base.smtp_settings = {
  domain:         'https://rails-app-adrian-2019.herokuapp.com',
  address:        "smtp.sendgrid.net",
  port:            587,
  authentication: :plain,
  user_name:      'apikey',
  password:       ENV['SENGRID_KEY']
}