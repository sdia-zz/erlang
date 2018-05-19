% simple hof
> Double = fun(X) -> 2 * X end.


% very useful for list

%% lists:foreach
foreach(Fun, [H|T]) ->
  Fun(H),
  foreach(Fun, T);

foreach(Fun, []) -> ok.

%% lists:map
map(Fun, [H|T]) ->
  [Fun(H)|map(Fun, T)];

map(Fun, []) -> [].


Add3 = fun(N) -> 3 + N end.
lists:map(Add3, [1,2,3]).
[4,5,6]

PrintCity = fun({City, {X, Temp}}) ->
  io:format("~-15w ~w ~w~n", [City, X, Temp])
end.

lists.foreach(PrintCity, [...])
