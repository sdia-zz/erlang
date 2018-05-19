-module(tut20).
-export([start/1, ping/2, pong/0]).

%% about linking processes

ping(N, Pong_PID) ->
  link(Pong_PID),
  do_ping(N, Pong_PID).

do_ping(0, _) ->
  %% the following is not printing... dunno why
  %% io:format("Ping is dying...~n", []),
  exit(ping);

do_ping(N, Pong_PID) ->
  Pong_PID ! {ping, self()},
  receive
    pong ->
      io:format("Ping received pong~n", [])
  end,
  do_ping(N - 1, Pong_PID).

pong() ->
  receive
    {ping, Ping_PID} ->
      io:format("Pong received ping~n", []),
      Ping_PID ! pong,
      pong()
  end.

start(Ping_Node) ->
  Pong_PID = spawn(tut20, pong, []),
  spawn(Ping_Node, tut20, ping, [3, Pong_PID]).
