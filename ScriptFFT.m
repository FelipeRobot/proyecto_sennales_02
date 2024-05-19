%% Read WAV File and get its properties
[x, fs] = audioread('DTMF 02.wav'); 
x = x(:,1); % Solo necesitamos un canal de las pistas
x_size = size(x);
x_length = length(x);
duration = x_length/ fs;

fprintf('Frecuencia de muestreo: %d Hz\n', fs);
fprintf('Duración de la señal: %f segundos\n', duration);

%% Plot and play the DTMF audio
y = linspace(0, duration, x_length);
T = duration/x_length; %duration time between samples
for i=1:1:x_length
    y(i) = T*i;
end
x_int = round(x .* 1024 - 1); % Máximo 1024-1, 10 bits AD

figure(1);
plot(y, x_int);
title('Secuencia DTMF en el dominio del tiempo');
xlabel('Tiempo (s)');
axis([0 duration -2048 2048]);

soundsc(x_int, fs); % Reproducir los tonos DTMF

%% Framing utilizando la función 'enframe'
wlen = 500;
inc = 250;
x_frame = enframe(x, wlen, inc)';
x_energy = sum(x_frame .* x_frame);

figure(2);
plot(x_energy);
title('Energía en corto tiempo de la secuencia DTMF');

Emax = max(x_energy);      % Encontrar la máxima magnitud de energía
x = [x; 0];
threshold = 0.5 * Emax;    % Establecer umbral de energía para separar los dígitos
eindex = find(x_energy > threshold);
dseg = findSegment(eindex);
dl = length(dseg);

phone_number = cell(1, dl); % Almacenar los números de teléfono detectados

%% Detectar los dígitos
for k = 1:dl
    n1 = dseg(k).begin;
    n2 = dseg(k).end;
    x1 = (n1 - 1) * inc + 1;
    x2 = (n2 - 1) * inc + 1;
    xt = x(x1:x2);  % Puntos de datos en cada segmento
    N = length(xt);
    
      if N < length(x)
        N = length(x);
        end
    

    [keyH, keyL, G_spect] = dtmf_G2(xt, N,fs); % Utilizar la función modificada para detectar los dígitos
    keydig = fk2dig(keyL, keyH); % Índice de fila, índice de columna
    phone_number{k} = keydig;
end

%% Mostrar resultados
disp('Números de teléfono detectados:');
disp(phone_number);