module MathGame
    class Player

        attr_accessor :name

        def initialize(name)
            @name = name
            @lives = 3
            puts "Player name is #{@name}"
        end

        def lose_life
            @live -= 1
        end

    end
end