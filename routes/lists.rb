module Sinatra
  module Checkr
    module Lists

      def self.registered(app)
        app.before do
          content_type :json
          headers 'access-control-allow-origin'  => '*',
                  'access-control-allow-methods' => ['options', 'get', 'post']
        end
      end

    end
  end
end