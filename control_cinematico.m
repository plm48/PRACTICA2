% Aseg�rate de iniciar el servidor en V-REP:
% en un child script de una escena de V-REP, a�ade el siguiente
% comando que se ejecute s�lo una vez, cuando comience la simulaci�n:
%
% simRemoteApi.start(23000)
%
% luego comienza la simulaci�n y ejecuta este programa.
%
% IMPORTANTE: para cada llamada con �xito a simxStart, 
% debe hacerse la correspondiente llamada a simxFinish al final

function control_cinematico()
    disp('Inicio del programa');
    vrep=remApi('remoteApi');
    vrep.simxFinish(-1); % por si hubiera una conexi�n anterior abierta
    clientID=vrep.simxStart('127.0.0.1',23000,true,true,5000,0.01);

    if (clientID>-1)
        disp('Conectado al servidor remoto de la API');

        % Ejemplo de env�o de una cadena de caracteres a V-REP:
        vrep.simxAddStatusbarMessage(clientID,'�Hola V-REP!',vrep.simx_opmode_oneshot);

        % Seleccionamos la primera articulaci�n del robot Mico    
        [errorCode,mico1]=vrep.simxGetObjectHandle(clientID,'Mico_joint1',vrep.simx_opmode_oneshot_wait);

        % Ejemplo de obtenci�n de la posici�n articular de la primera
        % articulaci�n del Kinova Mico
        [errorCode,q] =vrep.simxGetJointPosition(clientID, mico1, vrep.simx_opmode_oneshot_wait);

        % C�digo del controlador cinem�tico
        
        % Inicializaci�n de la ganancia K
        
        % C�lculo de la trayectoria y su velocidad
        
        % Inicialiazaciones (si se requieren)

        % Bucle de control
        

        % Ploteado de las figuras con la posici�n real del robot, el error
        % en posici�n, la velocidad real y el par real.
        
       
        % Antes de cerrar la conexi�n con V-REP, asegura que el �ltimo
        % comando enviado tuvo tiempo de llegar. Se puede asegurar con el
        % siguiente comando (por ejemplo):
        vrep.simxGetPingTime(clientID);

        % Ahora se cierra la conexi�n con V-REP:    
        vrep.simxFinish(clientID);
    else
        disp('Fallo en el intento de conexi�n al servidor remoto de la API');
    end
    vrep.delete(); % llamada al destructor
    
    disp('Fin del programa');
end
