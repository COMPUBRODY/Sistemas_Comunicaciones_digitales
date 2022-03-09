
%Este programa genera un pulso en l seal "x1"  sus correspondientes transformadas de fourier "Xf" con sus respectivos ejes temporales
%"tiempo" de 10 segundos y centrado en cero y frecuenciales "frec" de 100 herz y centrado en  cero respectivamente

clear all; close all;

tiempo  =   -5 :   .01 :   5;                   %define una ventana de observacion temporal
frec    =   -.5/.01 :   1/10    :   5/.01;      %ventana de observacion frecuencial:
%   la resolucion temporal implica la ventana de observacion frecuencial
%   mientras que la observacion temporal define la resolucion frecuencial

xt  =   zeros(1,length(tiempo));
cero    =    find(tiempo==0);
xt(cero-1/.01   :   cero+1/.01) =   1;  %hacemos el vector de la señal

Xf  =ttof(xt);      %transformamos de tiempo a frecuencia

subplot(2,1,1), plot(tiempo,xt);
subplot(2,1,2), plot(frec,Xf);