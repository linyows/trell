module Trell
  class Client
    module Tokens
      def tokens(username, options = {})
        get "members/#{username}/tokens", options
      end
    end
  end
end
