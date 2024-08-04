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
## @deftypefn {} {@var{retval} =} distancias (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Allan <allan@allan-IdeaPad-3-15ALC6>
## Created: 2024-08-01

function [D4, D8, De, Dm] =  distancias(arquivo, Px, Py, Qx, Qy)
  I = imread(arquivo);
  I = im2bw(I);
  
  D4 = calc_d4(Px, Py, Qx, Qy);
  D8 = calc_d8(Px, Py, Qx, Qy);
  De = calc_de(Px, Py, Qx, Qy);
  Dm = calc_dm(I,Px, Py, Qx, Qy);
endfunction

function retval = calc_d4 (Px, Py, Qx, Qy)
  retval = abs(Px - Qx) + abs(Py - Qy);
endfunction

function retval = calc_d8 (Px, Py, Qx, Qy)
  retval = max(abs(Px-Qx), abs(Py-Qy));
endfunction

function retval = calc_de (Px, Py, Qx, Qy)
  retval = sqrt((Px-Qx)^2 + (Py-Qy)^2);
endfunction

function retval = calc_dm (I, Px, Py, Qx, Qy)
  
endfunction
