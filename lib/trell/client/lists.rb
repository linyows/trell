module Trell
  class Client
    module Lists
      def lists(board_id, options = {})
        get "boards/#{board_id}/lists", options
      end

      def create_list(options = {})
        post 'lists', options
      end

      def list(id, options = {})
        get "lists/#{id}", options
      end

      def update_list(id, options = {})
        put "lists/#{id}", options
      end

      def delete_list(id, options = {})
        delete "lists/#{id}", options
      end
    end
  end
end
