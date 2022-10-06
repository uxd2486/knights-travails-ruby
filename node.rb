# frozen_string_literal: true

# Represents a node in the graph that
# represents moves the knight could
# make. One node (or vertex) represents
# one square on the chess board.
class Node
  attr_accessor :square, :neighbours, :parent

  def initialize(square, parent)
    @square = square
    @neighbours = []
    @parent = parent
  end

  def to_s
    @square.to_s
  end

  def ==(other)
    super || (
      self.class == other.class &&
        @square == other.square
    )
  end
end
