module Sinatra
  module Checkr
    module Users

      def self.registered(app)
        app.before do
          content_type :json
          headers 'access-control-allow-origin'  => '*',
                  'access-control-allow-methods' => ['options', 'get', 'post']
        end

        app.get '/user/:username' do
          user = User.first(username: params[:username])
          user.to_json
        end

        app.put '/user/:username' do
          user = User.first(username: params[:username])

          user.update({
            name:     params[:name],
            email:    params[:email],
            username: params[:username],
            password: params[:password]
          })

          user.save
        end

        app.delete '/user/:username' do
          user = User.first(username: params[:username])
          user.destroy
        end

        app.post '/user/create' do
          user = User.new({
            name:     params[:name],
            email:    params[:email],
            username: params[:username],
            password: params[:password]
          })

          user.save
        end
      end

    end
  end
end