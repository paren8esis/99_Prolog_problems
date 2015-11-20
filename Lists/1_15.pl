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

duplicate([], _, []).
duplicate([H|T], Num, Duplicated) :-
	dupl(H, Num, DuplH),
	duplicate(T, Num, DuplT),
	append(DuplH, DuplT, Duplicated).

dupl(_, 0, []).
dupl(X, Num, [X|DuplT]) :-
	Num > 0,
	NewNum is Num - 1,
	dupl(X, NewNum, DuplT).
