# frozen_string_literal: true

# Represents a node in the graph that
# represents moves the knight could
# make. One node (or vertex) represents
# one square on the chess board.
class Node
  attr_accessor :square, :neighbours, :parent

  @@transformations = [
    [+ 2,  + 1],
    [+ 2,  - 1],
    [- 2,  + 1],
    [- 2,  - 1],
    [+ 1,  + 2],
    [+ 1,  - 2],
    [- 1,  + 2],
    [- 1,  - 2]
  ].freeze

  def initialize(square, parent)
    @square = square
    @neighbours = []
    @parent = parent
  end

  def find_neighbours
    @neighbours = possible_moves
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

  private

  def possible_moves
    row = @square[0]
    col = @square[1]
    @@transformations.map { |row_tr, col_tr| [row + row_tr, col + col_tr] }
                     .select { |move| valid_move?(move) }
                     .map { |move| Node.new(move, self) }
  end

  def valid_move?(move)
    (move[0]).between?(0, 7) && (move[1]).between?(0, 7)
  end
end
