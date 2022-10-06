# frozen_string_literal: true

require_relative 'node'

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

def find_end(start, stop)
  queue = [Node.new(start, nil)]
  cur_node = queue.shift
  until cur_node.square == stop
    possible_moves(cur_node.square).each do |move|
      new_node = Node.new(move, cur_node)
      queue << new_node
      cur_node.neighbours << new_node
    end
    cur_node = queue.shift
  end
  cur_node
end

def build_path(stop, start)
  path = [stop]
  until stop.square == start
    stop = stop.parent
    path << stop
  end
  path
end

def knight_moves(start, stop)
  stop_location = find_end(start, stop)
  build_path(stop_location, start).reverse
end

start = [3, 3]
stop = [4, 3]
p = knight_moves(start, stop)
puts p
