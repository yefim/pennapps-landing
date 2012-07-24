require 'sinatra'
require 'debugger'
require_relative 'models'

get '/' do
  # sponsors go ['name', 'background-color', 'link', 'default-bg-color', 'additonal classes']
  @sponsors = [
    ['facebook', '#2B579E', 'http://facebook.com'],
    ['github', 'white', 'http://github.com'],
    ['twitter', 'white', 'http://twitter.com'],
    ['twilio','white', 'http://twilio.com'],
    ['google', 'white', 'http://google.com'],
    ['mongodb', '#3C2919', 'http://mongodb.com'],
    ['a16z', 'white', 'http://a16z.com'],
    ['venmo', 'white', 'http://venmo.com'],
    ['hunch', 'white', 'http://hunch.com'],
    ['microsoft', 'white', 'http://microsoft.com'],
    ['cloudmine', 'white', 'http://cloudmine.me'],
    #  ['monetate', 'white', 'http://monetate.com'],
    #  ['color', '#93b9b1', 'http://color.com'],
    ['zynga', 'white', 'http://zynga.com'],
    ['tumblr', '#2C4762', 'http://tumblr.com'],
    ['allsponsors', 'white', 'sponsors.html'],
    ['sponsorpennapps', '#B62F2F', 'http://pennapps.com/sponsorship.pdf', '#B62F2F', 'no-opacity']
  ]
  
  # pennappses go ['season', 'year', 'link']
  @pennappses = [
    ['Spring', '2012', 'http://2012s.pennapps.com/'],
    ['Fall', '2011', 'http://2011f.pennapps.com/'],
    ['Spring', '2011', 'http://pennapps.com/spring2011/'],
    ['Fall', '2010', 'http://pennapps.com/2010'],
    ['Fall', '2009', 'http://pennapps.com/2009']
  ]
  erb :index
end

post '/' do
  u = User.new(email: params[:email])
  content_type :json
  u.save
end
