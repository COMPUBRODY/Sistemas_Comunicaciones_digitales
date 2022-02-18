%%  Esta rutina Genera la simulacion de un sistema de comunicaciones BPSK

%%  Transmisor

%   Se genera una señal BPSK con los siguientes Datos
%   - señalBPSK =   BPSK_pb(num_bits,srate, filt, muest_porbit);
clear all; close all;
num_bits    =10000 %Numero bits a transmitir
srate      =.01    
filt        ='sqrt'
muest_porbit    =5
[filtrotrans,senalBPSK,t,senalding] =   BPSK_pb(num_bits,srate,filt,muest_porbit)

%%  Canal con Ruido Aditivo

%   señal a ruido especificada

SNR_deseado_dB  =4;
senal_masruido  =awgn(SNR_deseado_dB,senalBPSK);




%%  Receptor con Filtro Acoplado
%   La señal es pasada atravez de un filtro acoplado al filtro del transmisor
%   para maximizar la relacion señal a ruido

senal_recib =matched_filter(filtrotrans, senal_masruido);

%%  Dispositivo de Decision
%   la señal recibida es pasada por el circuito de desicion
%   que regresa el vector de bits detectados, asi como el numero de bits erroneos contados

umbral  =0;
[num_bits,bits_detectados]=desicion(umbral,senal_recib,num_bits,muest_porbit,t,senalding,srate);

%%  Graficacion BER teorico y Simulado
%   los bits con error se grafican sobre la curva teorica la señal recibida es pasada 
%   por el circuito de decision que regresa el vector de bits detectados, asi como el numero de bits erroneos contados 

grafica_BERySNR(SNR_deseado_dB,num_bits_erroneos,num_bits);