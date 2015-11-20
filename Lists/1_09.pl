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

pack([], []).
pack([X], [[X]]).

pack([H1,H2|T], [PackedH|PackedT]) :-
	H1 == H2,
	pack([H2|T], [PackedHPrev|PackedT]),
	append([H1], PackedHPrev, PackedH).

pack([H1,H2|T], [[H1]|PackedT]) :-
	H1 \== H2,
	pack([H2|T], PackedT).

%% 1.09 (**):  Pack consecutive duplicates of list elements into sublists.

%% pack(L1,L2) :- the list L2 is obtained from the list L1 by packing
%%    repeated occurrences of elements into separate sublists.
%%    (list,list) (+,?)

%pack([],[]).
%pack([X|Xs],[Z|Zs]) :- transfer(X,Xs,Ys,Z), pack(Ys,Zs).

%% transfer(X,Xs,Ys,Z) Ys is the list that remains from the list Xs
%%    when all leading copies of X are removed and transfered to Z

%transfer(X,[],[],[X]).
%transfer(X,[Y|Ys],[Y|Ys],[X]) :- X \= Y.
%transfer(X,[X|Xs],Ys,[X|Zs]) :- transfer(X,Xs,Ys,Zs).

