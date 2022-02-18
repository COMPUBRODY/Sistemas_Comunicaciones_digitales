function    [filtrotrans,senalBPSK,t,senaldig] =    BPSK_pb(num_bits,srate,filt,muest_porbit);

%   Este progama genera una señal modulada BPSK en su representacion compleja pasabajas
%   num_bits    especifica el numero de bits a transmitir, debe ser numero par y maor a 100;
%   srate       especifica el intervalo de muestreo
%   filt        especifica si se utiliza un filtro 'cosa' para coseno alzado, 'sqrt' para raiz de coseno alzado  y 'rect'    para un filtro rectandula
%   muest_porbit    especificael numero de muestras por bit que se utilizaran en la simulacion, debe ser numero impar

senaldig = round(rand(1,num_bits));
senal       =2*(senaldig-.5)        %se genera señal binaria de valores [1,-1]

% se produce la señal con el filtro formador

T   =   (num_bits + 10) * muest_porbit  *   srate;
t   =   -T/2    :   srate   :   T/2;
senaldiscretal  =   zeros(1,length(t)); %se genera la señal con deltas centradas en Ts
cero   = find(t==0);
senaldiscreta(cero-((num_bits/2)*muest_porbit)   :   muest_porbit    :   cero+((num_bits/2)*muest_porbit)-muest_porbit   ) =   senal;          %se generala señal con deltas centrada en Ts
%se definen los valores de los pulsos
pulsocuadrado   =   zeros(1,length(t));
pulsocuadrado(  cero-((muest_porbit-1)/2)   :   cero+(  (muest_porbit-1/2))      ) = 1;
frcosine    =   zeros(1,length(t));
if filt=='sqrt'
    frcosine(   cero-(3*muest_porbit)   :   cero+3*muest_porbit)  =   rcosine(1,muest_porbit,'sqrt');

else
    frcosine(   cero-(3*muest_porbit)   :   cero+3*muest_porbit)  =   rcosine(1,muest_porbit);
end

if  filt=='rect'
    filtrotrans =   pulsocuadrado;
else
    filtrotrans =   frcosine;
end

filtrotrans =   filtrotrans/sqrt(filtrotrans*filtrotrans');

%---Se convolucionan los datos con el filtro transmisor
senalBPSK   =   convrec(senaldiscretal,filtrotrans);

%---Se grafican los resultados
figure;
subplot(2,1,1), plot(t,senalBPSK);
axis([-7*srate*muest_porbit  7*srate*muest_porbit-1.1    1.1])
xlabel('Señal BPSK generada en tiempo');
hold on;
subplot(2,1,2), stem(t,senaldiscretal, 'r');
hold off;
subplot(2,1,1), plot(t,filtrotrans);
axis([-7*srate*muest_porbit 7*srate*muest_porbit-1.1 1.1]);
xlabel('Filtro de Transmisor Seleccionado');

%------------------------- FIN DE FUNCION BPSK_pb.m ----------------------------



