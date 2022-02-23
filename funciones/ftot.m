
function senaltemp = ftot(senalfreq) ;

% descentrar la frecuencia
xtrof = ifftshift(senalfreq);
%convertir a tiempo
inv_f_f = ifft(xtrof);
% centrar en tiempo
senaltemp = fftshift(inv_f_f);