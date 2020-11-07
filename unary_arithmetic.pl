%%% %%%
%!  unary_arithmetic.pl

unary(0).
unary(s(N)) :- unary(N).

%  usum/3
%   il predicato è vero quando il terzo argomento e' la somma unaria dei
%   primi due

usum(0, s(N), s(N)) :- unary(N).
usum(s(U1), U2, s(U3)) :- usum(U1, U2, U3).

%!  end of file -- unary_arithmetic.pl
