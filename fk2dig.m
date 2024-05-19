function keydig = fk2dig(keyH, keyL)
    % Mapeo de frecuencias a dígitos DTMF
    DTMF_table = ['1', '2', '3', ;...
                  '4', '5', '6';...
                  '7', '8', '9';...
                  '*', '0', '#'];
    
    % Verificar las frecuencias y devolver el dígito correspondiente
    if keyH >= 1 && keyH <= 4 && keyL >= 1 && keyL <= 4
        keydig = DTMF_table(keyL, keyH); % El índice [row, column] se invierte para acceder a la tabla
    else
        keydig = 'No válido';
    end
end
