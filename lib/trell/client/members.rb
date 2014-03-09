module Trell
  class Client
    module Members
      def board_members(board_id, options = {})
        get "boards/#{board_id}/members", options
      end
      alias_method :mebers, :board_members

      def member(member, options = {})
        get "members/#{member}", options
      end

      def update_member(member, options = {})
        put "members/#{member}", options
      end
    end
  end
end
