require 'sinatra/base'
require 'sinatra/json'

class Checkr < Sinatra::Base

  before do
    content_type :json
    headers 'access-control-allow-origin'  => '*',
            'access-control-allow-methods' => ['options', 'get', 'post']
  end

  get '/user' do
    json({ name: 'Adam', age: 29 })
  end
end