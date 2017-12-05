module MathGame
    class Player

        attr_accessor :name, :lives

        def initialize(name)
            @name = name
            @lives = 3
            puts "#{@name} starts with #{@lives} lives."
        end

        def lose_life
            @lives -= 1
        end

    end
end