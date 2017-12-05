module MathGame

    class Player

        @@players = 1

        attr_accessor :name, :lives

        def initialize
            set_player_name
            @lives = 3
            puts "Good luck, #{@name}!  You begin with #{@lives}."
            @@players += 1
        end

        def set_player_name
            puts "Please enter a name for Player #{@@players}: "
            @name = gets.chomp
            if @name == ''
                puts 'Cannot be blank...'
                set_player_name
            end
        end

        def lose_life
            @lives -= 1
        end

    end
end