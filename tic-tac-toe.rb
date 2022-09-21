class Tic_Tac_Toe
    @@game_board = []


    def initialize
        @@game_board = ['1','2','3','4','5','6','7','8','9']
    end

    def printout
        print <<-HEREDOC

        #{@@game_board[0]} | #{@@game_board[1]} | #{@@game_board[2]}
       ---+---+---
        #{@@game_board[3]} | #{@@game_board[4]} | #{@@game_board[5]}
       ---+---+---
        #{@@game_board[6]} | #{@@game_board[7]} | #{@@game_board[8]}
        HEREDOC
    end

    def move(pos, piece)
        @@game_board[pos-1] = piece
    end
end

class Player
    @@winning_moves = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

    def initialize(piece_char)
        @piece_char = piece_char
        @moves = []
    end

    def has_won?()
        @@winning_moves.any?{|line|
            line.all?{|position| 
                @moves.each{|move| move == position }
            }
        }
    end

    def add_move(move)
        @moves.push(move)
    end
end

def gamin_time()
    print "Pick which symbol you would like to use to represent yourself, Player 1: "
    char_2 = " "
    check_char_1 = true
    check_char_2 = true
    while check_char_1
        char_1 = gets.chomp
        if (char_1.ord >= 65 && char_1.ord <= 90) || (char_1.ord >= 97 && char_1.ord <= 122)
            check_char_1 = false
            print "Pick a symbol to represent yourself, Player 2 as long as it's not \" " + char_1 + "\" :"
            while check_char_2
                char_2 = gets.chomp
                if (char_2.ord >= 65 && char_2.ord <= 90) || (char_2.ord >= 97 && char_2.ord <= 122) 
                    check_char_2 = false
                else    
                    print "Invalid choice, please try again: "
                end
            end
        else 
            print "Invalid choice, please try again: "
        end
    end
    player_1 = Player.new(char_1)
    player_2 = Player.new(char_2)
end
