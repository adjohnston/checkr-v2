require 'sinatra/base'
require 'sinatra/json'
require './config/database'
require './routes/users'
require './routes/lists'

class Checkr < Sinatra::Base

  register Sinatra::Checkr::Users
  register Sinatra::Checkr::Lists

end