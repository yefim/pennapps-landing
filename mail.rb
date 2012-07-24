require 'pony'
require_relative 'config'

def email(options={})
  Pony.mail to: options[:to],
            from: "professor.geoff@gmail.com",
            subject: options[:subject],
            body: options[:body],
            port: '587',
            via: :smtp,
            via_options: {
              address: 'smtp.gmail.com',
              port: '587',
              enable_starttls_auto: true,
              user_name: EMAIL, # set in config.rb to 'yefim323' or 'naruto137'
              password: PASSWORD, # your gmail pass
              authentication: :plain,
              domain: 'localhost:4567'
            }
end
