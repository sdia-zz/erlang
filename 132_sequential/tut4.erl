-module(tut4).
-export([list_length/1]).



list_length([]) ->
  0;
list_length([H|T]) ->
  1 + list_length(T).
