% Funkcija movavg(x,y,n) za vhodne podatke x = [x0, ..., xN]
% in izhodne podatke y = [y0, ..., yN] poišče  koeficiente H = [h1, ..., hn]
% za model drsečega povprečja z n zakasnitvami
%
% Funkcija sestavi matriko A(dimenzije (N-n+2)xn)iz vektorja vhodov x in s pomočjo Moore–Penrose inverza
% izračuna potrebene koeficiente h v enačbi:
% A*h = y
%
% Enačba, ki povezuje x,y in h:
% y(t) = h1*x(t-n+1) + h2*x(t-n+2) + ... + hn-1*x(t-1) + hn*x(t)
%
% Vhodni podatki:
% x ... vektor vhodnih podatkov: 1x(N+1),
% y ... vektor izhodnih podatkov: 1x(N+1),
% n ... število zakasnitev (konstanta): 1x1
% Rezultat:
% h ... koeficienti, ki so rešitev enačbe A*h = y (vektor): nx1 
%
% Autor: Aleksandar Hristov <ah6874@student.uni-lj.si>

function h = movavg(x,y,n)
  dolX = numel(x) - 1; %Izracunamo N
  startIndex = 1;
  endIndex = n;
  %sestavimo matriko A tako da uzamemo usakiš po n vrednosti
  A = [x(startIndex:endIndex)];
  for i=1:dolX-n+1
    startIndex = startIndex + 1;
    endIndex = endIndex + 1;
    A=[A;x(startIndex:endIndex)];
  endfor
  %MP inverz
  Aplus = pinv(A);
  %Vzamemo samo y vrednosti od n-1 naprej
  y= [y(n:end)];
  %rezultat
  h = Aplus * y';
end
%ce sta xi = yi = 1 pricakujemo, da so koeficienti 1/n
%!test abs(movavg([1 1 1 1 1 1], [1 1 1 1 1 1] , 3) - ([1 1 1] / 3)) < eps;
%
%!test abs(movavg([1 2 3 4 5 6], [0 8 13 18 23 28] ,2) - [2 3]) < eps; 
%
%ce je n večji od dolzine x ali y, pricakujemo error
%!error movavg([1 1 1 1 1 1], [1 1 1 1 1 1],7);