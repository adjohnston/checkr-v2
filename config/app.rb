require './config/database'
require './helpers/warden'
require './routes/sessions'
require './routes/users'
require './routes/lists'
require './routes/items'

class Checkr < Sinatra::Base

  use Rack::Session::Cookie, secret: ENV['SESSION_SECRET']

  use Warden::Manager do | config |
    config.default_strategies :bcrypt
    config.failure_app = self
  end

  Warden::Manager.serialize_into_session { | user |      user.id }
  Warden::Manager.serialize_from_session { | id |        User.get(id) }
  Warden::Manager.before_failure         { | env, opts | env['REQUEST_METHOD'] = "POST" }

  Warden::Strategies.add(:bcrypt) do
    def authenticate!
      fail! unless @user = User.first(username: params['username'])

      if @user.password == params['password']
        success!(@user)
      else
        fail!
      end
    end
  end

  before do
    content_type :json
    headers 'access-control-allow-origin'  => '*',
            'access-control-allow-methods' => ['options', 'get', 'post']
  end

  register Sinatra::Checkr::Sessions
  register Sinatra::Checkr::Users
  register Sinatra::Checkr::Lists
  register Sinatra::Checkr::Items

end