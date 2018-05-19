-module(tut21).
-export([start/1, ping/2, pong/0]).

ping(N, Pong_PID) ->
  link(Pong_PID),
  do_ping(N, Pong_PID).

do_ping(0, _) ->
  exit(ping);

do_ping(N, Pong_PID) ->
  Pong_PID ! {ping, self()},
  receive
    pong ->
      io:format("Ping received pong ~n", [])
  end,
  do_ping(N - 1, Pong_PID).

pong() ->
  process_flag(trap_exit, true),
  do_pong().

do_pong() ->
  receive
    {ping, Ping_PID} ->
      io:format("Pong received ping~n", []),
      Ping_PID ! pong,
      do_pong();
    {'EXIT', From, Reason} ->
      io:format("Pong exiting, got ~p~n", [{'EXIT', From, Reason}])
  end.

start(Ping_Node) ->
  Pong_PID = spawn(tut21, pong, []),
  spawn(Ping_Node, tut21, ping, [3, Pong_PID]).
