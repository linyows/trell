module Trell
  class Client
    module Boards
      def all_boards(options = {})
        get 'boards', options
      end

      def boards(username, options = {})
        get "members/#{username}/boards", options
      end

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
