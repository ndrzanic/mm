function h = movavg(x, y, n)
% Funkcija movavg(x,y,n) za vhodne podatke x = [x0, ..., xN] in izhodne podatke y = [y0, ... , yN] poišèe koeficiente h = [h1, ..., hn] ki resijo sistem Ah = y 
%
% Vhodni podatki: 
% x ... Nx1 vektor vhodnih podatkov sistema, kjer je N+1 stevilo merjenj
% y ... N- n +1 x 1 vektor izhodnih podatkov sistema 
% n ... stevilo neznank 
% Rezultat: 
% h ... nx1 vektor neznank
%
% Avtor: Nik Drzanic <nd4958@student.uni-lj.si>
N = columns(x); 
for i = 1:(N-n+1)
  for j = 1:n
    A(i,j) = x(1, i+j-1); % napolnimo matriko A z ustreznimi koeficienti vhodnih podatkov x = [x0, ..., xN]
  end
end
test = y(n:N);
h = (A\test')';
endfunction
