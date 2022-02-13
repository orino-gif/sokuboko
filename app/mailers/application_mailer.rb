class ApplicationMailer < ActionMailer::Base
  default from: "#{ENV['ADMINISTRATOR_MAIL']}"
  layout 'mailer'
end
