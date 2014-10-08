require 'sinatra/base'
require 'sinatra/json'
require './config/database'

class Checkr < Sinatra::Base

  before do
    content_type :json
    headers 'access-control-allow-origin'  => '*',
            'access-control-allow-methods' => ['options', 'get', 'post']
  end

  get '/users' do
    users = User.all
    users.to_json
  end
end