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

run_length([X], [[1, X]]).
run_length([], []).

run_length([H1, H2|T], [[Num, H1]|Rest]) :-
	H1 == H2,
	run_length([H2|T], [[NumRest, H1]|Rest]),
	Num is NumRest + 1.

run_length([H1, H2|T], [[1, H1], [Num, H2]|Rest]) :-
	H1 \== H2,
	run_length([H2|T], [[Num, H2]|Rest]).


%% 1.13 (**): Run-length encoding of a list (direct solution) 

%% encode_direct(L1,L2) :- the list L2 is obtained from the list L1 by 
%%    run-length encoding. Consecutive duplicates of elements are encoded 
%%    as terms [N,E], where N is the number of duplicates of the element E.
%%    However, if N equals 1 then the element is simply copied into the 
%%    output list.
%%    (list,list) (+,?)

%encode_direct([],[]).
%encode_direct([X|Xs],[Z|Zs]) :- 
%	count(X,Xs,Ys,1,Z), 
%	encode_direct(Ys,Zs).

%% count(X,Xs,Ys,K,T) Ys is the list that remains from the list Xs
%%    when all leading copies of X are removed. T is the term [N,X],
%%    where N is K plus the number of X's that can be removed from Xs.
%%    In the case of N=1, T is X, instead of the term [1,X].

%count(X,[],[],1,X).
%count(X,[],[],N,[N,X]) :- 
%	N > 1.
%count(X,[Y|Ys],[Y|Ys],1,X) :- 
%	X \= Y.
%count(X,[Y|Ys],[Y|Ys],N,[N,X]) :- 
%	N > 1, X \= Y.
%count(X,[X|Xs],Ys,K,T) :- 
%	K1 is K + 1, count(X,Xs,Ys,K1,T).

