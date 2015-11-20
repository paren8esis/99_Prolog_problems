% Copyright 2015 paren8esis

% This program is free software: you can redistribute it and/or modify
%    it under the terms of the GNU General Public License as published by
%    the Free Software Foundation, either version 3 of the License, or
%    (at your option) any later version.

%    This program is distributed in the hope that it will be useful,
%    but WITHOUT ANY WARRANTY; without even the implied warranty of
%    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%    GNU General Public License for more details.

%    You should have received a copy of the GNU General Public License
%    along with this program.  If not, see <http://www.gnu.org/licenses/>.

% Valid knight moves
move([X1,Y1], [X2,Y2]) :-	%1
	Y2 is Y1 - 2,   	  
	X2 is X1 + 1. 
move([X1,Y1], [X2,Y2]) :-	%2	
	Y2 is Y1 - 2,   	  
	X2 is X1 - 1.
move([X1,Y1], [X2,Y2]) :-	%3
	Y2 is Y1 + 1,   		  
	X2 is X1 + 2.
move([X1,Y1], [X2,Y2]) :-	%4
	Y2 is Y1 - 1,   	  
	X2 is X1 + 2.
move([X1,Y1], [X2,Y2]) :-	%5
	Y2 is Y1 + 2,   	  
	X2 is X1 + 1.
move([X1,Y1], [X2,Y2]) :-	%6
	Y2 is Y1 + 2,   	  
	X2 is X1 - 1.
move([X1,Y1], [X2,Y2]) :-	%7
	Y2 is Y1 + 1,   		  
	X2 is X1 - 2.
move([X1,Y1], [X2,Y2]) :-	%8
	Y2 is Y1 - 1,   	  
	X2 is X1 - 2.


knights_tour(N, Start, Path) :-
	produce_coords(N, N, Coords, []),
	del(Start, Coords, NewCoords),
	sol(NewCoords, N, Start, Path).

sol([], _, _, []).
sol(Coords, N, Start, [H|Path]) :-
	move(Start, H),
	member(H, Coords),
	del(H, Coords, NewCoords),
	sol(NewCoords, N, H, Path).

produce_coords(0, _, Coords, Coords).
produce_coords(Row, N, Coords, PartialCoords) :-
	produce_cols(Row, N, Cols),
	append(Cols, PartialCoords, NewPartialCoords),
	NewRow is Row - 1,
	produce_coords(NewRow, N, Coords, NewPartialCoords).

produce_cols(_, 0, []).
produce_cols(Row, N, [[Row, N]|T]) :-
	NewN is N - 1,
	produce_cols(Row, NewN, T).

del(X, [X|T], T).
del(X, [H|T], [H|Deleted]) :-
	X \== H,
	del(X, T, Deleted).


