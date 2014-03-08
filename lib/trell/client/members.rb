module Trell
  class Client
    module Members
      def members(board_id, options = {})
        get "boards/#{board_id}/members", options
      end

      def member(member, options = {})
        get "members/#{member}", options
      end

      def update_member(member, options = {})
        put "members/#{member}", options
      end
    end
  end
end
