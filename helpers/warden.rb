module Sinatra
  module Warden
    module Helpers

      def current_user
        env['warden'].user.to_json
      end

    end
  end
end