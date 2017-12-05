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
            @current_player = 0
        end

        def current_player
            @players[@current_player]
        end

        def change_turns
            @current_player = (@current_player + 1) % @players.length
        end

        def player_loses_life
            current_player.lose_life
        end

        def start
            puts "Our math game is about to start!"
            until game_over? do
                puts "It is #{current_player.name}'s turn."
                # TODO: Ask a Question
                player_loses_life
                print_score
                change_turns
            end
            # TODO change to a final score print out.
            print_score
        end

        def game_over?
            @players.any? { |player| player.lives == 0 }
        end

        def print_score
            @players.each do |player|
                puts "#{player.name} has #{player.lives} lives remaining."
            end
        end

    end
end