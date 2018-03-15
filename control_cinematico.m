% Asegúrate de iniciar el servidor en V-REP:
% en un child script de una escena de V-REP, añade el siguiente
% comando que se ejecute sólo una vez, cuando comience la simulación:
%
% simRemoteApi.start(23000)
%
% luego comienza la simulación y ejecuta este programa.
%
% IMPORTANTE: para cada llamada con éxito a simxStart, 
% debe hacerse la correspondiente llamada a simxFinish al final

function control_cinematico()
    disp('Inicio del programa');
    vrep=remApi('remoteApi');
    vrep.simxFinish(-1); % por si hubiera una conexión anterior abierta
    clientID=vrep.simxStart('127.0.0.1',23000,true,true,5000,0.01);

    if (clientID>-1)
        disp('Conectado al servidor remoto de la API');

        % Ejemplo de envío de una cadena de caracteres a V-REP:
        vrep.simxAddStatusbarMessage(clientID,'¡Hola V-REP!',vrep.simx_opmode_oneshot);

        % Seleccionamos la primera articulación del robot Mico    
        [errorCode,mico1]=vrep.simxGetObjectHandle(clientID,'Mico_joint1',vrep.simx_opmode_oneshot_wait);

        % Ejemplo de obtención de la posición articular de la primera
        % articulación del Kinova Mico
        [errorCode,q] =vrep.simxGetJointPosition(clientID, mico1, vrep.simx_opmode_oneshot_wait);

        % Código del controlador cinemático
        
        % Inicialización de la ganancia K
        
        % Cálculo de la trayectoria y su velocidad
        
        % Inicialiazaciones (si se requieren)

        % Bucle de control
        

        % Ploteado de las figuras con la posición real del robot, el error
        % en posición, la velocidad real y el par real.
        
       
        % Antes de cerrar la conexión con V-REP, asegura que el último
        % comando enviado tuvo tiempo de llegar. Se puede asegurar con el
        % siguiente comando (por ejemplo):
        vrep.simxGetPingTime(clientID);

        % Ahora se cierra la conexión con V-REP:    
        vrep.simxFinish(clientID);
    else
        disp('Fallo en el intento de conexión al servidor remoto de la API');
    end
    vrep.delete(); % llamada al destructor
    
    disp('Fin del programa');
end
