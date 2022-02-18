%%  Esta rutina Genera la simulacion de un sistema de comunicaciones BPSK

%%  Transmisor

%   Se genera una señal BPSK con los siguientes Datos
%   - señalBPSK =   BPSK_pb(num_bits,srate, filt, muest_porbit);
clear all; close all;
num_bits    =10 000 %Numero bits a transmitir
strate      =.01    
filt        ='sqrt'
muest_porbit    =5
[filtrotrans,senalBPSK,t,senalding] =   BPSK_pb(num_bits,srate,filt,muest_porbit)

%%  Canal con Ruido Aditivo
%   Se toma la señaly se le suma un ruido con potencia tal que se tiene una relacion 
%   señal a ruido especificada




%%  Receptor con Filtro Acoplado
%   La señal es pasada atravez de un filtro acoplado al filtro del transmisor
%   para maximizar la relacion señal a ruido


%%  Dispositivo de Decision
%   la señal recibida es pasada por el circuito de desicion
%   que regresa el vector de bits detectados, asi como el numero de bits erroneos contados


%%  Graficacion BER teorico y Simulado
%   los bits con error se grafican sobre la curva teorica la señal recibida es pasada 
%   por el circuito de decision que regresa el vector de bits detectados, asi como el numero de bits erroneos contados 
