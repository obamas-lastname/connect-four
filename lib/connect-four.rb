require_relative './board.rb'

class ConnectFour
    attr_accessor :board, :player

    def initialize
        @board = Board.new
        @player = 1
    end

    def user_input
        puts "Choose a column to place your piece (1-7):"
        a = gets.chomp
        a
    end

    def verify_input(a)
        if a.to_i > 0 and a.to_i < 8
            return true
        else
            puts "Enter a valid number"
            false
        end
    end

    def round
        @board.display()
        puts "It is turn of player #{@player} to move"
        a = user_input
        while verify_input(a) == false do
            a=user_input
        end
        a = a.to_i
        col = a - 1
        row = 5 - @board.last_empty[col]
        if @player == 1
            @board.grid[row][col].put_0
        else
            @board.grid[row][col].put_x
        end
        @board.last_empty[col] += 1
        @player = 3 - @player
    end

    def game
        while !@board.won? do
            round
        end
        @player = 3 - @player
        @board.display()
        puts "Game over! Player #{@player} wins!"
    end

end

game = ConnectFour.new
   
game.game