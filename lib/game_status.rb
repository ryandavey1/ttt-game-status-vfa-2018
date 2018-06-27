# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def won?(board)
winner = []
empty_board = board.all? {|x| x == " "}
WIN_COMBINATIONS.each do |win_combination|
    if empty_board || full?(board)
      return nil
    elsif win_combination.all? { |value| board[value] =="X" } || win_combination.all? { |value| board[value] =="O" }
      winner = win_combination
    end
  end
  return winner
end

def full?(board)
  !board.any? { |x| x == " " }
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  elsif !won?(board) && !full?(board) || !won?(board)
    return false
  end
end

def over?(array3)
  if full?(array3) || !(won?(array3)) || draw?(array3)
    puts "GAME OVER"
    return true
  else 
    puts "it ain't over till it's over baby!"
    return false 
  end 
end  

def winner(board)
  if winning_combo = won?(board)
    board[winning_combo.first]
  end
end
