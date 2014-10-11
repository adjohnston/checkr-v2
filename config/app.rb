# Dir[File.expand_path('../src/**/*.rb', __FILE__)].each {|file| require file }

require './config/database'
require './routes/users'
require './routes/lists'

class NotAuthenticated
  def call(env)
    [ 200, {}, ['not allowed']]
  end
end

class Checkr < Sinatra::Base

  enable :sessions

  # register Sinatra::Checkr::Users
  # register Sinatra::Checkr::Lists

  use Rack::Session::Cookie, secret: 'shh!'

  use Warden::Manager do | config |
    config.scope_defaults :default,
                          strategies: [:bcrypt],
                          action: 'not_authenticated'
    config.failure_app = self
    config.serialize_into_session { | user | user.id }
    config.serialize_from_session { | id | User.get(id) }
  end

  Warden::Strategies.add(:bcrypt) do
    def valid?
      params[:password] && params[:username]
    end

    def authenticate!
      fail! unless user = User.first(username: params[:username])

      if user.password == params[:password]
        success!(user)
      else
        fail!
      end
    end
  end

  get '/not_authenticated' do
    'not working'
  end

  post '/login' do
    env['warden'].authenticate!
  end

end