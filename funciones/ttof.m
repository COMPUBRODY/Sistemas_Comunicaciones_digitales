
function    senalfrec   =   ttof(senaltemp);
%senalfrec  =   ttof(senaltemp) realiza una transformacion de una señal temporal senaltemp, graficada
%con el cero en la mitad del vector a una señal frecuencial senalfrec, graficada con el cero Hertz a la mitad de la funcion
    xtrot   =   ifftshift(senaltemp);

    Xfrot   =   fft(xtrot);

    senalfrec   =   fftshift(Xfrot);

