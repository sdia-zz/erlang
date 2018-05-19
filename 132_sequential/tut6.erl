-module(tut6).
-export([list_max/1]).

list_max([H|T])       -> list_max(T, H).
list_max([], M)       -> M;
list_max([H|T], M)
  when H > M          -> list_max(T, H);
list_max([_H|T], M)   -> list_max(T, M).
