class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,4,8],[2,4,6],[0,3,6],[1,4,7],[2,5,8]]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, current_player)
    @board[index] = current_player
  end

  def position_taken?(index)
  !(@board[index].nil? || @board[index] == " ")
end

  def valid_move?(index)
  index.between?(0,8) && !position_taken?(board, index)
  end
  
  def turn(board)
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(board, index)
      move(board, index, current_player(board))
      display_board(board)
    else
      turn(board)
    end
  end

def turn_count
  @board.count{|token| token == "X" || token == "O"}
end

def current_player(board)
  if turn_count(board)%2 ==0
    current_player = "X"
  else
    current_player = "O"
end
return current_player
end

def won?(board)
WIN_COMBINATIONS.each do |array|
    if array.all? { |value| board[value] =="X" } || array.all? { |value| board[value] =="O" }
      return array
    end
  end
  return false
end

def full?(board)
  !@board.any? { |x| x == " " }
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

  def winner(board)
  if winning_combo = won?(board)
    board[winning_combo.first]
  else
  end
end

def play(board)
  until over?(@board) == true || won?(@board) != false
  puts 'turn'
    turn(@board)
  end
  if won?(@board)
  puts "Congratulations #{winner(board)}!"
elsif draw?(@board)
    puts "Cat's Game!"
  else
    return nil
  end
end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

end
