require 'sinatra/base'

class Checkr < Sinatra::Base
  get '/' do
    "hello world"
  end
end