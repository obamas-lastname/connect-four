class Square
    attr_accessor :completed, :value
    
    def initialize
        @value = "."
        @completed = false
    end

    def put_0
        @value = "0"
        @completed = true
    end

    def put_x
        @value = "X"
        @completed = true
    end

    def both
        @value + @completed.to_s
    end
end

class Board
    attr_accessor :grid, :values, :last_empty
    def initialize
        @last_empty = Array.new(7, 0)
        @grid = Array.new(6) {Array.new(7)}
        6.times do |row_index|
            7.times do |column_index|
                @grid[row_index][column_index] = Square.new
            end
        end
        @values = Array.new(6) {Array.new(7)}
    end

    def empty?
        6.times do |row_index|
            7.times do |column_index|
                if @values[row_index][column_index] != "."
                    return false
                end
            end
        end
        return true
    end

    def update
        6.times do |row_index|
            7.times do |column_index|
                @values[row_index][column_index] = @grid[row_index][column_index].value
            end
        end
    end

    def display
        update
        @values.each { |x|
            puts x.join(" ")
        }
    end

    def won?
        update
        return false if empty?
      
        6.times do |row_index|
          array = @values[row_index]
          (0..3).each do |i|
            if array[i] != '.' && array[i] == array[i + 1] && array[i] == array[i + 2] && array[i] == array[i + 3]
              return true
            end
          end
        end

        7.times do |j|
            (0..3).each do |i|
              if @values[i][j] != '.' && @values[i][j] == @values[i + 1][j] && @values[i][j] == @values[i + 2][j] && @values[i][j] == @values[i + 3][j]
                return true
              end
            end
        end

        (0..2).each do |row|
            (0..3).each do |col|
              if @values[row][col] != '.' && 
                 @values[row][col] == @values[row + 1][col + 1] && 
                 @values[row][col] == @values[row + 2][col + 2] && 
                 @values[row][col] == @values[row + 3][col + 3]
                return true
              end
            end
          end
      
          # Check ascending diagonals (bottom-left to top-right)
          (3..5).each do |row|
            (0..3).each do |col|
              if @values[row][col] != '.' && 
                 @values[row][col] == @values[row - 1][col + 1] && 
                 @values[row][col] == @values[row - 2][col + 2] && 
                 @values[row][col] == @values[row - 3][col + 3]
                return true
              end
            end
          end
      
        false
    end
      
end