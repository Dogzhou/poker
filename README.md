# Poker

Given a list of poker hands, return a list containing the highest scoring hand.

If two or more hands tie, return the list of tied hands in the order they were received.

The basic rules and hand rankings for Poker can be found at:

https://en.wikipedia.org/wiki/List_of_poker_hands

For this exercise, we'll consider the game to be using no Jokers,
so five-of-a-kind hands will not be tested. We will also consider
the game to be using multiple decks, so it is possible for multiple
players to have identical cards.

Aces can be used in low (A 2 3 4 5) or high (10 J Q K A) straights, but do not count as
a high card in the former case.

For example, (A 2 3 4 5) will lose to (2 3 4 5 6).

You can also assume all inputs will be valid, and do not need to perform error checking
when parsing card values. All hands will be a list of 5 strings, containing a number
(or letter) for the rank, followed by the suit.

Ranks (lowest to highest): 2 3 4 5 6 7 8 9 10 J Q K A
Suits (order doesn't matter): C D H S

Example hand: ~w(4S 5H 4C 5D 4H) # Full house, 5s over 4s

# Development Environment
*Elixir 1.3.2

# Usage
```
$ iex -S mix
iex(1)> high_of_8 = ~w(4D 5S 6S 8D 3C)
iex(2)> high_of_10 = ~w(2S 4C 7S 9H 10H)
iex(3)> high_of_jack = ~w(3S 4S 5D 6H JH)
iex(4)> Poker.best_hand([high_of_8, high_of_10, high_of_jack])
iex(5)> [high_of_jack]
```

## License

Licensed under [MIT](http://edwardzhou.mit-license.org/).

