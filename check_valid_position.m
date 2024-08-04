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
## @deftypefn {} {@var{retval} =} check_valid_position (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Allan <allan@allan-IdeaPad-3-15ALC6>
## Created: 2024-07-24

function retval = check_valid_position (rows, cols, x, y)
    retval = (x <= rows && y <= cols);
endfunction
