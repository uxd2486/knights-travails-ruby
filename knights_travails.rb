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
  (move[0]).between?(0, 7) && (move[1]).between?(0, 7)
end

def knight_moves(start, stop)
  puts start, stop
end
