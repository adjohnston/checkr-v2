module Sinatra
  module Checkr
    module Lists

      def self.registered(app)
        app.get '/:username/lists' do
          @user  = User.first(username: params[:username])
          @lists = List.all(user: user).to_json
        end

        app.get '/:username/list/:id' do
          @user = User.first(username: params[:username])
          @list = List.first(id: params[:id], user: @user).to_json
        end

        app.post '/:username/list/create' do
          @user = User.first(username: params[:username])
          @list = List.new({
            user:      @user,
            name:      params[:name],
            desc:      params[:desc],
            is_public: params[:is_public]
          }).save
        end

        app.put '/:username/list/:id' do
          @user = User.first(username: params[:username])
          @list = List.first(id: params[:id], user: @user)

          @list.update({
            name:      params[:name],
            desc:      params[:desc],
            is_public: params[:is_public]
          }).save
        end

        app.delete '/:username/list/:id' do
          @user = User.first(username: params[:username])
          @list = List.first(id: params[:id], user: @user).delete
        end
      end

    end
  end
end