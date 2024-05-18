
%%------------------Lectura y preparación del archivo-------------
[audio_digitos, fs] = audioread("Audios\DTMF 01.wav");

valor_muestreo = length(audio_digitos);

duracion = valor_muestreo/fs;

delta_sennal = 1/duracion;

%-----Transformada rápdida de Fourier----

ffft_audio_digitos= fft(audio_digitos);

f = [0:delta_sennal:fs-delta_sennal];

%-------Gráfica de la señal

plot(f, abs(ffft_audio_digitos));
xlabel('Frecuencia (Hz)');
ylabel('Magnitud');
title('Espectro de Frecuencia');

plot(abs(ffft_audio_digitos), f);

%soundsc(audio_digitos, fs);

for i = 0: length(f)
    if f(i) > 20
        printf(abs(ffft_audio_digitos));

    end
end


