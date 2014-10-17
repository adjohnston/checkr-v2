module Sinatra
  module Warden
    module Helpers

      def current_user
        env['warden'].user
      end

    end
  end
end