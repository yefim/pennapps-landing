require 'sinatra'
require 'json'
require 'securerandom'
require 'debugger'
require_relative 'models'
require_relative 'mail'

# sponsors go ['name', 'background-color', 'link', 'default-bg-color', 'additonal classes']
@@sponsors = [
  ['facebook', '#2B579E', 'http://facebook.com'],
  # ['github', 'white', 'http://github.com'],
  # ['twitter', 'white', 'http://twitter.com'],
  # ['twilio','white', 'http://twilio.com'],
  ['google', 'white', 'http://google.com'],
  ['mongodb', '#3C2919', 'http://mongodb.com'],
  # ['a16z', 'white', 'http://a16z.com'],
  ['venmo', 'white', 'http://venmo.com'],
  ['hunch', 'white', 'http://hunch.com'],
  # ['microsoft', 'white', 'http://microsoft.com'],
  # ['cloudmine', 'white', 'http://cloudmine.me'],
  #  ['monetate', 'white', 'http://monetate.com'],
  #  ['color', '#93b9b1', 'http://color.com'],
  # ['zynga', 'white', 'http://zynga.com'],
  ['tumblr', '#2C4762', 'http://tumblr.com'],
  ['palantir', 'white', 'http://palantir.com'],
  ['mashery', 'white', 'http://mashery.com'],
  ['yahoo', 'white', 'http://yahoo.com'],
  ['lore', 'white', 'http://lore.com'],
  ['allsponsors', 'white', '/sponsors'],
  ['sponsorpennapps', '#B62F2F', 'http://pennapps.com/sponsorship.pdf', '#B62F2F', 'no-opacity']
]

# pennappses go ['season', 'year', 'link']
@@pennappses = [
  ['Spring', '2012', 'http://2012s.pennapps.com/'],
  ['Fall', '2011', 'http://2011f.pennapps.com/'],
  ['Spring', '2011', 'http://pennapps.com/spring2011/'],
  ['Fall', '2010', 'http://pennapps.com/2010'],
  ['Fall', '2009', 'http://pennapps.com/2009']
]

get '/sponsors' do
  erb :sponsors
end

get '/:rec_url?' do |rec_url|
  @action = rec_url || '/'
  erb :index
end

post '/:rec_url?' do |rec_url|
  resp = {}
  u = User.new(
    email: params[:email],
    recommendation_url: SecureRandom.hex(3)
  )
  if u.save
    if rec_url && rec = User.first(recommendation_url: rec_url)
      debugger
      rec.recommendations << Recommendation.create(email: params[:email])
      # Email.create(
      rec.save
    end
    # use resque to email
    email(to: u.email, subject: 'Thank you for registering', body: "Currently, you have #{u.recommendations.length} referrals. Your personal URL is http://pennapps.com/#{u.recommendation_url}")
    resp["message"] = "Your unique URL is http://pennapps.com/#{u.recommendation_url}"
    content_type :json
    resp.to_json
  else
    resp["error"] = "Invalid email"
    context_type :json
    resp.to_json
  end
end
