# Knights Travails
This project is a part of [The Odin Project](https://www.theodinproject.com/lessons/ruby-knights-travails).

## The Problem
We are given an 8x8 chessboard, a starting square and end
square and must find the shortest path a knight can take
between those squares. The knight can move the same as in
chess: 2 steps forward, 1 step to the side. "Forward" here
can mean any direction.

## My Solution
I have represented this problem as a graph. Each vertex
(or node) of the graph represents a square on the board,
and two nodes are connected if the knight can move from
one node to the other.  
My solution has two stages. First, it builds the graph 
beginning at the starting square, using Breadth First
Search, until it finds the end square. Then, it
backtracks from the end square and builds the path until
it reaches the starting square.

### How do we know this is the shortest path?
In my solution, the first time I find the end square I 
assume I've found the shortest path. But how can I know
this is really the shortest path?  
This is because I use BFS to create the graph. In BFS, we
first look at all the neighbours of the current node 
before looking at the neighbours neighbours. In terms of
the chess board, we can understand this as we are
checking if we can reach the end square from the current
square before we move to a different square. So, the
first time we reach the end square has to be shortest
path, because if there was a shorter path, we would have
seen it before this one.