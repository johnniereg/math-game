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
            @current_player = rand(0..1)
        end

        def greet_players
            @players.each do |player|
                puts "Hello #{player.name}"
                puts 'Would you like to change your name? (y/N) '
                if gets.chomp == 'y'
                    puts 'Enter your new name: '
                    player.name = gets.chomp
                    puts "Your new name is: #{player.name}"
                end
            end
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

        def game_over?
            @players.any? { |player| player.lives == 0 }
        end
        
        def print_score
            puts "#{@players[0].name}: #{@players[0].lives}/3 lives vs #{@players[1].name}: #{@players[1].lives}/3 lives"
        end
        
        def ask_question
            question = MathGame::Question.new
            puts question.question
            player_answer = gets.chomp
            if player_answer.to_i == question.answer
                puts "#{current_player.name}: You got it!"
            else
                puts "#{current_player.name}: Sorry, that's incorrect."
                player_loses_life
            end
        end

        def declare_winner
            @players[0].lives = 0 ? winner = @players[1] : winner = @players[0]
            puts "The winner is #{winner.name}!"
        end
        
        def start
            puts "Our math game is about to start!"
            greet_players
            puts "Randomly selecting the first player..."
            until game_over? do
                puts "--New Turn--"
                puts "It is #{current_player.name}'s turn."
                ask_question
                print_score
                change_turns
            end
            declare_winner
        end

    end
end