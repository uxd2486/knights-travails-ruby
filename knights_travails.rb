# frozen_string_literal: true

require_relative 'node'

def find_end(start, stop)
  queue = [Node.new(start, nil)]
  cur_node = queue.shift
  until cur_node.square == stop
    cur_node.find_neighbours.each { |new_node| queue << new_node }
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
