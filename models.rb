require 'data_mapper'

# DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/development.db")

class User
  include DataMapper::Resource

  property :id, Serial
  property :email, String
  property :recommendation_url, String
  has n, :recommendations
end

class Recommendation
  include DataMapper::Resource
  
  property :id, Serial
  property :email, String
end

DataMapper.auto_upgrade!
