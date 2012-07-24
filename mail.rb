require 'pony'
require_relative 'config'

Pony.mail to: "yefim323@gmail.com",
          from: "yefim323@gmail.com",
          subject: "helllo",
          body: "whhhat",
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
