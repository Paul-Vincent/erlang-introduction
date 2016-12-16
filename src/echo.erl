-module(echo).
-export([start/0]).
-export([loop/0]).

start() -> 
	spawn(echo, loop, []).

loop() -> 
	receive
		reload -> echo:loop();
		X -> 
			io:format("~p received ~p~n", [self(),  X]),
			loop()
	end.
	
		