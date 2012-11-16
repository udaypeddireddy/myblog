ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  #:domain               => "railscasts.com",
  :user_name            => "user01.canopy@gmail.com",
  :password             => "canopyone",
  :authentication       => "plain",
  :enable_starttls_auto => true
}

ActionMailer::Base.default_url_options[:host] = "localhost:3000"
