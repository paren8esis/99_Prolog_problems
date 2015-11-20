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

rotate(List, Pos, Rotated) :-
	rotateit(List, Pos, LastElems, FirstElems),
	reverse(LastElems, LastElems2),
	append(LastElems2, FirstElems, Rotated).

rotateit(List, 0, [], List).
rotateit([], _, [], []).
rotateit(List, Pos, [Last|LastElems], FirstElems) :-
	Pos > 0,
	getlast(List, Last, ListAfter),
	NewPos is Pos - 1,
	rotateit(ListAfter, NewPos, LastElems, FirstElems).

getlast([X], X, []).
getlast([H|T], Last, [H|ListAfter]) :-
	getlast(T, Last, ListAfter).

% Δεύτερη λύση μου: 
%
%rotate(List, 0, List).
%rotate([H|T], Places, Rotated) :-
%	Places > 0,
%	append(T, [H], RotatedOne),
%	NewPlaces is Places - 1,
%	rotate(RotatedOne, NewPlaces, Rotated).
%rotate([H|T], Places, Rotated) :-
%	Places < 0,
%	removeLast([H|T], Last, Removed),
%	NewPlaces is Places + 1,
%	rotate([Last|Removed], NewPlaces, Rotated).


%removeLast([X], X, []).
%removeLast([H|T], Last, Rest) :-
%	removeLast(T, Last, RestT),
%	append([H], RestT, Rest).
