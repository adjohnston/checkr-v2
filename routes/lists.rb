module Sinatra
  module Checkr
    module Lists

      def self.registered(app)
        app.before do
          content_type :json
          headers 'access-control-allow-origin'  => '*',
                  'access-control-allow-methods' => ['options', 'get', 'post']
        end

        app.get '/user/:username/lists' do
          user  = User.first(username: params[:username])
          lists = List.all(user: user).to_json
        end

        app.get '/user/:username/list/:id' do
          user = User.first(username: params[:username])
          list = List.first(id: params[:id], user: user).to_json
        end

        app.post '/user/:username/list/create' do
          user = User.first(username: params[:username])
          list = List.new({
            user:      user,
            name:      params[:name],
            desc:      params[:desc],
            is_public: params[:is_public]
          })

          list.save
        end

        app.put '/user/:username/list/:id' do
          user = User.first(username: params[:username])
          list = List.first(id: params[:id], user: user)

          list.update({
            name:      params[:name],
            desc:      params[:desc],
            is_public: params[:is_public]
          })

          list.save
        end

        app.delete '/user/:username/list/:id' do
          user = User.first(username: params[:username])
          list = List.first(id: params[:id], user: user)
          list.delete
        end
      end

    end
  end
end