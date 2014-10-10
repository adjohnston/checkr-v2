module Sinatra
  module Checkr
    module Users

      def self.registered(app)
        app.before do
          content_type :json
          headers 'access-control-allow-origin'  => '*',
                  'access-control-allow-methods' => ['options', 'get', 'post']
        end

        app.get '/users' do
          User.all.to_json
        end

        app.get '/user/:username' do
          debugger
          authenticate!
        end

        app.post '/user' do
          user = User.new({
            name:     params[:name],
            email:    params[:email],
            username: params[:username],
            password: params[:password]
          })

          if user.save
            return true
          else
            return false
          end
        end
      end

    end
  end
end