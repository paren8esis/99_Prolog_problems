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

slice([], _, _, []).
slice([H|_], Index1, 1, [H]):-
	Index1 =< 1.
slice([H|T], Index1, Index2, [H|SlicedT]) :-
	Index1 =< 1, Index2 >= 1,
	NewIndex1 is Index1 - 1,
	NewIndex2 is Index2 - 1,
	slice(T, NewIndex1, NewIndex2, SlicedT).
slice([_|T], Index1, Index2, Sliced) :-
	Index1 > 1,
	Index2 > 1,
	NewIndex1 is Index1 - 1,
	NewIndex2 is Index2 - 1,
	slice(T, NewIndex1, NewIndex2, Sliced).	


%% 1.18 (**):  Extract a slice from a list

%% slice(L1,I,K,L2) :- L2 is the list of the elements of L1 between
%%    index I and index K (both included).
%%    (list,integer,integer,list) (?,+,+,?)

%slice([X|_], 1, 1, [X]).
%slice([X|Xs], 1, K, [X|Ys]) :- 
%	K > 1, 
%	K1 is K - 1, 
%	slice(Xs, 1, K1, Ys).
%slice([_|Xs], I, K, Ys) :- 
%	I > 1, 
%	I1 is I - 1, 
%	K1 is K - 1, 	
%	slice(Xs, I1, K1, Ys).

