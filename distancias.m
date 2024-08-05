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

function [D4, D8, De, Dm] =  distancias(I, Px, Py, Qx, Qy)
  addpath('fila');
  %I = imread(arquivo);
  %I = im2bw(I);
  
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
  valorRegiao = I(Px,Py);
  if valorRegiao != I(Qx,Qy)
    retval = false;
    return;
  endif
  retval = getDistanciaDM(I, Px, Py, Qx, Qy, valorRegiao);
endfunction

function distanciaDM = getDistanciaDM(matriz,linhaOrigem,colOrigem,linhaDestino,colDestino,valorRegiao)
  visitados = containers.Map();
  chaveCoordPixelOrigem = criarChaveDaCoord(linhaOrigem,colOrigem);
  visitados(chaveCoordPixelOrigem) = false;
  filaVisitas = {[linhaOrigem, colOrigem]};
  distanciaDM = false;

  while !isempty(filaVisitas)
    [filaVisitas, coordenadas] = dequeue(filaVisitas);
    chaveCoordPixelAtual = criarChaveDaCoord(coordenadas(1), coordenadas(2));

    if coordenadas(1) == linhaDestino && coordenadas(2) == colDestino
      distanciaDM = contaPredecessores(visitados,chaveCoordPixelAtual,0);
      return;
    end

    coordVizinhosConexosM = getCoordVizinhosConexosM(matriz,coordenadas(1),coordenadas(2),valorRegiao);

    for i = 1:numel(coordVizinhosConexosM)
      l = coordVizinhosConexosM{i}(1);
      c = coordVizinhosConexosM{i}(2);
      chaveCoordPixelVizinho = criarChaveDaCoord(l, c);
      if !isKey(visitados, chaveCoordPixelVizinho)
        visitados(chaveCoordPixelVizinho) = chaveCoordPixelAtual;
        enqueue(filaVisitas, [l,c]);
      endif
    end

  end
endfunction

function predecessoresTotal = contaPredecessores(visitados, chave, predecessores)
  if chave
    predecessores++;
    predecessoresTotal = contaPredecessores(visitados, visitados(chave), predecessores);
    return;
  end
  predecessoresTotal = predecessores;
endfunction


function coordVizinhosConexosM = getCoordVizinhosConexosM(matriz, linha, col, valorRegiao)
  coordVizinhosConexosM = {};

  coordVizinhosD = getCoordVizinhos(matriz,linha,col,'d');

  for i = 1:numel(coordVizinhosD)
    l = coordVizinhosD{i}(1);
    c = coordVizinhosD{i}(2);
    if matriz(l,c) == valorRegiao && ehCaminhoDiagonalValido(matriz,linha,col,l,c,valorRegiao)
      coordVizinhosConexosM{end + 1} = [l,c];
    end
  end

  coordVizinhos4 = getCoordVizinhos(matriz,linha,col,4);

  for i = 1:numel(coordVizinhos4)
    l = coordVizinhos4{i}(1);
    c = coordVizinhos4{i}(2);
    if matriz(l,c) == valorRegiao
      coordVizinhosConexosM{end + 1} = [l,c];
    end
  end
end

function validade = ehCaminhoDiagonalValido(matriz,linhaOrigem,colOrigem,linhaDestino,colDestino,valorRegiao)
  validade = false;
  if linhaDestino > linhaOrigem && colDestino > colOrigem
    if matriz(linhaOrigem, colOrigem + 1) == valorRegiao
        return;
    elseif matriz(linhaOrigem + 1, colOrigem) == valorRegiao
        return;
    else
        validade = true;
    end
  elseif linhaDestino > linhaOrigem && colDestino < colOrigem
    if matriz(linhaOrigem, colOrigem - 1) == valorRegiao
        return;
    elseif matriz(linhaOrigem + 1, colOrigem) == valorRegiao
        return;
    else
        validade = true;
    end
  elseif linhaDestino < linhaOrigem && colDestino < colOrigem
    if matriz(linhaOrigem, colOrigem - 1) == valorRegiao
        return;
    elseif matriz(linhaOrigem - 1, colOrigem) == valorRegiao
        return;
    else
        validade = true;
    end
  elseif linhaDestino < linhaOrigem && colDestino > colOrigem
    if matriz(linhaOrigem, colOrigem + 1) == valorRegiao
        return;
    elseif matriz(linhaOrigem - 1, colOrigem) == valorRegiao
        return;
    else
        validade = true;
    end
  else
    error('Náo é caminho diagonal');
  end
endfunction

function chave = criarChaveDaCoord(linha,col)
  chave = [int2str(linha) ' ' int2str(col)];
endfunction
