require 'dm-core'
require 'dm-types'
require 'dm-timestamps'
require 'dm-migrations'
require 'bcrypt'

DataMapper::Logger.new($stdout, :debug)

DataMapper.setup(:default, 'postgres://adam@localhost/checkr')

class User
  include DataMapper::Resource

  property   :id,            Serial
  property   :email,         String,     required: true, unique: true
  property   :username,      String,     required: true, unique: true
  property   :password,      BCryptHash, required: true
  property   :name,          String,     required: true
  property   :sign_in_count, Integer,    default: 0
  timestamps :created_at,
             :updated_on

  has n, :lists
end

class List
  include DataMapper::Resource

  property   :id,         Serial
  property   :name,       String, required: true
  property   :desc,       Text
  property   :is_public,  Boolean
  timestamps :created_at,
             :updated_on

  belongs_to :user
  has n, :items
end

class Item
  include DataMapper::Resource

  property   :id,         Serial
  property   :name,       String, required: true
  property   :desc,       String
  property   :url,        String
  property   :is_checked, Boolean
  timestamps :created_at,
             :updated_on

  belongs_to :list
end

DataMapper.finalize
DataMapper.auto_upgrade!