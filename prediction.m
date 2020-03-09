function y = prediction(x, h)
% Funkcija prediction(x,h) iz vhodnih podatkov x = [x0, ..., xN] in koeficientov h = [h1, ... , hn] napove izhod y na podlagi nasega modela za sistem Ah = y 
% Vhodni podatki: 
% x ... Nx1 vektor vhodnih podatkov sistema, kjer je N+1 stevilo merjenj
% h ... nx1 vektor neznank
% Rezultat: 
% y ... N- n +1 x 1 vektor izhodnih podatkov sistema 
%
% Avtor: Nik Drzanic <nd4958@student.uni-lj.si>
N = columns(x);
n = columns(h);
for i = 1:(N-n+1)
  for j = 1:n
    A(i,j) = x(1, i+j-1); % napolnimo matriko A z ustreznimi koeficienti vhodnih podatkov x = [x0, ..., xN]
  end
end
y = A*h';
endfunction
%!test
%!assert(columns(prediction(x,h)), columns(h)) 