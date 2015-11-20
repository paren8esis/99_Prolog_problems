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

drop(List, Index, Dropped) :-
	drop_it(List, Index, Index, Dropped).

drop_it([], _, _, []).
drop_it([_|T], 1, Index, DroppedT) :-
	drop_it(T, Index, Index, DroppedT).
drop_it([H|T], CurrentIndex, Index, [H|DroppedT]) :-
	CurrentIndex > 1,
	NewCurrentIndex is CurrentIndex - 1,
	drop_it(T, NewCurrentIndex, Index, DroppedT).
