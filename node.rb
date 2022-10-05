# frozen_string_literal: true

# Represents a node in the graph that
# represents moves the knight could
# make. One node (or vertex) represents
# one square on the chess board.
class Node
  attr_accessor :square, :neighbours

  def initialize(square)
    @square = square
    @neighbours = []
  end

  def ==(other)
    super || (
      self.class == other.class &&
        @square == other.square
    )
  end
end
