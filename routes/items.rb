module Sinatra
  module Checkr
    module Items

      def self.registered(app)
        app.get '/:username/list/:list/items' do
          @user  = User.first(username: params[:username])
          @list  = List.first(id: params[:list], user: @user)
          @items = Item.all(list: @list).to_json
        end

        app.post '/:username/list/:list/item/create' do
          @user = User.first(username: params[:username])
          @list = List.first(id: params[:list], user: @user)
          @item = Item.new({
            name:       params[:name],
            desc:       params[:desc],
            url:        params[:url],
            is_checked: params[:is_checked],
            list:       @list
          }).save
        end

        app.delete '/:username/list/:list/item/:id' do
          @user = User.first(username: params[:username])
          @list = List.first(id: params[:list], user: @user)
          @item = Item.first(id: params[:id], list: @list).delete
        end
      end

    end
  end
end