# Welcome!

Welcome to the Luce Operation Simulator! Luce is a services platform and part of the day-to-day business is dispatching our ground staff to perform jobs around the city. This simulator is designed to help you understand the operational challenges of such work as well as showcase your problem solving skills.

## Running

This project uses Ruby 3.3.0 and you run it with `ruby main.rb`.

## Objective

Given a _weighted bi-directional_ grid (more on that below) your task is to implement a strategy that visits all nodes in minimal time and incurring minimal travel cost. To do that you need to implement one or more _Players_. The entry point is located at `main.rb#your_strategy`. The travel cost is calculated as a sum of weights of edges travelled.

Player is a class that extends `BasePlayer` and has one public method `next_point` which should return a hash corresponding to the next point to visit. See `random_player.rb` as an example which implements random walk pattern.

All Players start outside of the grid so the first call to `next_point` should return a starting point of the player on the grid (see `game.rb#add_player` and `main.rb` to see how the game initializes your player).

You can choose any point within the grid coordinates to start from. However, after that you are only allowed to move to points connected to your current position or stay at current position (all nodes are connected to themselves with 0 weight). Moving to an invalid position will be ignored by the simulation.

## Grid

Your a given a bi-directional grid of size N x N (2 <= N <= 1000) where you can move up/down or left/right (not diagonally). This gird is implemented in `grid.rb` and exposes a HashMap `edges` with weights that correspond to travel distance between two points on the grid.

The points on the grid addressed by the key `{row: X, col: Y}` and the counting starts from 0 bottom left corner. Let's look at an example:

Given a 2x2 grid A would be `{row: 0, col: 0}` and C will be `{row: 1, col: 0}`. The distance between two will be stored in `edges[{row: 0, col: 0}][{row: 1, col: 0}]`.

```
C---D
|   |
A---B
```

Another example of a 3x3 grid, here the middle point M will be referenced as `{row: 1, col: 1}` and Y is at `{row: 2, col: 2}`.

```
P---P---Y
|   |   |
P---M---P
|   |   |
P---P---P
```

The grid is initialized with random weights. To fix "randomness" and have reproducible results the seed is configured in `main.rb` on line 6. Change it if you want to generate a new grid.

# Your Submission

Your submission should be _this_ git repo with new commits that implement your strategy. You are free to create as many files/players as you need (see tips below). Make sure you configure your strategy in `main.rb` and your code runs successfully by running `ruby main.rb`.

Your submission will be evaluated based on your strategy design, performance and code quality. You are not required to write unit tests. We do value clean code and good coding practices.

Projects uses Ruby 3.3.0.

## Tips on Solving

1. Spend 10-15min playing with the simulator changing `grid_size` in `main.rb` and running the default random strategy. You will notice that we have included a `your_player.rb` which always return `0, 0` point so it never finishes the grid and the game times out in 1 mln steps. That's the setting from `main.rb#68`.
2. Start by implemeting a "single player" strategy of your choice by implementing `next_point` method in `your_player.rb`. Your first goal should be to implement a strategy that beats random walk on grid of size 100.
3. With the time left spend it on a "multi player" strategy. We suggest you looking at 2-3 players setup to keep it interesting and doable. Keep in mind that players make their moves sequentially (see `game.rb#27`) so you can implement some information sharing between them if you want.
4. Make sure you have 10-15 min left to clean up your code, remove unnecessary system prints. We would appreciate if you include comments explaining your solution in code or separate NOTES.md. However, keep in midn that clean Ruby code speaks for itself!
