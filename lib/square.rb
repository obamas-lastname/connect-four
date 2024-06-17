require_relative '..\colored-master\lib\colored.rb'
class Square
    attr_accessor :completed, :value
    
    def initialize
        @value = "."
        @completed = false
    end

    def put_0
        @value = "0".white_on_red
        @completed = true
    end

    def put_x
        @value = "X".white_on_yellow
        @completed = true
    end

    def both
        @value + @completed.to_s
    end
end
