module Trell
  class Client
    module Labels
      class << self
        def colors
          %i(
            blue
            green
            orange
            purple
            red
            yellow
          )
        end
      end

      self.colors.each do |color|
        class_eval <<-RUBY
          def change_board_#{color}_label(board_id, options = {})
            put "boards/\#{board_id}/labelNames/#{color}", options
          end
        RUBY
      end
    end
  end
end
