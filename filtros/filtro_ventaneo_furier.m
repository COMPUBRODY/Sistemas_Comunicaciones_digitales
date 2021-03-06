close all;
frec=-1:1/200:1;
lenf=length(frec);
x=zeros(1,lenf);
x(101:301)=1;
plot(frec,x);
%% Part 2
x = int32(x);
y=real(ftot(x));
ventanahamm=zeros(1,lenf);
ventanahamm(191:211)=hamming(21); %Ventana Hamming de 21 coeficientes
%ventanahamm (191:211)=ones(1,21);
filtro=y.*ventanahamm;
hold on;
plot(frec,real(ttof(filtro)), 'r');
hold off;

%%  Comportamiento con Señal de Voz y suma de senoidal

%vector=wavread('prueba.wav');
%info=audioinfo('prueba.wav');
[vector,Fs] = audioread('prueba.wav');
sound(vector,8000);
tiempo=1:length(vector);
xsen=sin(2*pi*(3/8)*tiempo);
seyruido=vector'+xsen;
plot(tiempo,seyruido);
sound(seyruido,8000);
frec2=-4000:8000/(length(vector)):4000-8000/(length(vector));
figure(2); %Se grafica la señal más el ruido en tiempo y frecuencia
subplot(2,1,1), plot(tiempo,seyruido);
subplot(2,1,2), plot(frec2, real(ttof(seyruido)));
figure(3); %Se grafican en frecuencia la señal sola y la señal con ruido
subplot(2,1,1), plot(frec2, real(ttof(seyruido)));
subplot(2,1,2), plot(frec2, real(ttof(vector)));

%%  Recuperacion de la señal con Filtrado

salida=filter(filtro,1,seyruido);
figure(4); %Se grafica la señal filtrada
subplot(2,1,1), plot(tiempo,seyruido);
subplot(2,1,2), plot(tiempo,salida);
sound(salida,8000);
salida2=conv(seyruido,filtro);
figure(5);
plot(salida2);
