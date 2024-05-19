addpath("Audios\");

% Llama a la función principal del programa.
Main();

%Declaración de variables para la dirección de rutas
aud_1 = 'Audios\DTMF 06.wav';
aud_2 = 'Audios\DTMF 13.wav';



% Función principal del programa.
function Main()
state_holder(); %llamado del menú

end

function state_holder() % Se declara la función para mostrar el menú.
    msg = sprintf('Segundo proyecto de MATLAB - Felipe Useche & Alejandro Llerena\n\nElija qué audio DTMFT Quiere descifrar:');

    
    state = menu( msg,'6' ,'13');
    
        switch state 
            case 1
                FFT_06
                pause();
                main();% Vuelve al menú principal.
            case 2
                ScriptFFT('Audios\DTMF 13.wav');
                main();% Vuelve al menú principal.
          
              
        end
end



   
