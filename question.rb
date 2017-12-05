module MathGame
    class Question

        def initialize
            @first_num = rand(1...20)
            @second_num = rand(1...20)
        end

        def clue
            "What is the sum of #{@first_num} and #{@second_num}?"
        end

        def answer
            @first_num + @second_num
        end

    end
end