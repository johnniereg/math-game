module MathGame
    class Game
        def self.main 
            game = Game.new
            game.start
        end

        def initialize
            @players = [
                MathGame::Player.new('Player 1'),
                MathGame::Player.new('Player 2')
            ]
        end

        def start
            puts "Game starting."
        end

    end
end