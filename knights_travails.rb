# frozen_string_literal: true

TRANSFORMATIONS = [
  [+ 2,  + 1],
  [+ 2,  - 1],
  [- 2,  + 1],
  [- 2,  - 1],
  [+ 1,  + 2],
  [+ 1,  - 2],
  [- 1,  + 2],
  [- 1,  - 2]
].freeze

def possible_moves(square)
  row = square[0]
  col = square[1]
  TRANSFORMATIONS.map { |row_tr, col_tr| [row + row_tr, col + col_tr] }
                 .select { |move| valid_move?(move) }
end

def valid_move?(move)
  (move[0]).positive? && move[0] < BOARD_SIZE && (move[1]).positive? && move[1] < BOARD_SIZE
end

def knight_moves(start, stop)
  puts start, stop
end
