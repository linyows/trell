module Trell
  class Client
    module Boards
      def member_boards(username, options = {})
        get "members/#{username}/boards", options
      end
      alias_method :boards, :member_boards

      def organization_boards(name, options = {})
        get "organizations/#{name}/boards", options
      end
      alias_method :org_boards, :organization_boards

      def create_board(options = {})
        post 'boards', options
      end

      def board(id, options = {})
        get "boards/#{id}", options
      end

      def update_board(id, options = {})
        put "boards/#{id}", options
      end

      def delete_board(id, options = {})
        delete "boards/#{id}", options
      end
    end
  end
end
