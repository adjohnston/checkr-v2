Bundler.require(:default, :test)

require 'rack/test'
require './config/app'

RSpec.configure do | config |
  config.include Rack::Test::Methods
  config.include Warden::Test::Helpers

  DataMapper.setup(:default, 'postgres://adam@localhost/checkr_test')
  DataMapper.finalize
  DataMapper.auto_migrate!

  def app
    Checkr
  end
end