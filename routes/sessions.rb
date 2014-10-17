module Sinatra
  module Checkr
    module Sessions

      def self.registered(app)
        app.post '/login' do
          env['warden'].authenticate!
        end

        app.get '/logout' do
          env['warden'].logout
        end

        app.post '/unauthenticated' do
          'not authenticated'
        end
      end

    end
  end
end