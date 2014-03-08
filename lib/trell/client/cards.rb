module Trell
  class Client
    module Cards
      def cards(board_id, options = {})
        get "boards/#{board_id}/cards", options
      end

      def create_card(options = {})
        post 'cards', options
      end

      def card(id, options = {})
        get "cards/#{id}", options
      end

      def update_card(id, options = {})
        put "cards/#{id}", options
      end

      def delete_card(id, options = {})
        delete "cards/#{id}", options
      end
    end
  end
end
