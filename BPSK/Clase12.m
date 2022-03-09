[sen,Fs]    =   audioread('fire_fire.wav');
sen(1:2000) = 0;    %Limpiar el transitorio
sound[sen,8000];
sen = interp(1:65881);
sound[sen_int,64000];
tiempo = -.5:1/64000:.5;
frecuencia = -3200:1:32000;
portadora = cos (2*pi*20200*tiempo) ;
sen_mod_portadora.*sen_int';
figure(1);
plot(tiempo,sen_mod);
length(sen_mod)
figure(2);
plot(frecuencia,abs(ttof(sen_mod)));

