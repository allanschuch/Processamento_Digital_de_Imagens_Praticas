## Copyright (C) 2024 Allan
##
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <https://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {} {@var{retval} =} interpolacao_bilinear (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Allan <allan@allan-IdeaPad-3-15ALC6>
## Created: 2024-07-24

function retval = interpolacao_bilinear (I, Rx, Ry, fatorX, fatorY, tx, ty)
  
  [rows, cols] = size(I);
  
  if Ry == rows && Rx == cols
    retval = I(Ry, Rx);
    return;  
  elseif Ry == rows
    R = I(Ry, Rx);
    S = I(Ry, Rx+1);
    T = R;
    U = S;
  elseif Rx == cols
    R = I(Ry, Rx);
    S = R;
    T = I(Ry+1, Rx);
    U = T;
  else
    R = I(Ry, Rx);
    S = I(Ry, Rx+1);
    T = I(Ry+1, Rx);
    U = I(Ry+1, Rx+1);
  endif
  
  Q1 = (1-(tx/fatorX))*R + tx/fatorX*S;
  Q2 = (1-(tx/fatorX))*T + tx/fatorX*U;
  
  retval = (1-(ty/fatorY))*Q1 + ty/fatorY*Q2;

endfunction
