class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@cloud-dressing.herokuapp.com'
  layout 'mailer'
end
