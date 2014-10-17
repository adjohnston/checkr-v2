module Sinatra
  module Checkr
    module Users

      def self.registered(app)
        # app.before do
        #   env['warden'].authenticated?
        # end

        app.get '/:username' do
          @user = User.first(username: params[:username]).to_json
        end

        app.get '/current_user' do
          current_user.to_json
        end

        app.put '/:username' do
          current_user.update({
            name:     params[:name],
            email:    params[:email],
            username: params[:username],
            password: params[:password]
          }).save
        end

        app.delete '/:username' do
          current_user.to_json.destroy
        end

        app.post '/user/create' do
          User.new({
            name:     params[:name],
            email:    params[:email],
            username: params[:username],
            password: params[:password]
          }).save
        end
      end

    end
  end
end