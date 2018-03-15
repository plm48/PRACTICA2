This simulation was created following the steps belong to the next web:
https://robologs.net/2017/07/04/interaccion-entre-v-rep-y-matlab/

0- Copy all the files inside of apega folder in the Matlab's bin folder.

1- Open matlab in 'apega' folder

2- open V-rep and creating a new scene.

3- Create a child (threatened) script in V-rep and copy this patch at the very beginning:
simExtRemoteApiStart(19999) 

4- Start the simulation in V-rep.

5- copy and paste in Matlab the following code:
vrep=remApi('remoteApi'); %Crear el objeto vrep y cargar la libreria
clientID=vrep.simxStart('127.0.0.1',19999,true,true,5000,5) %Iniciar conexion con el simulador
vrep.simxFinish(clientID); %Terminar la conexion

6- If the answer is 0 everything is correct otherwise you should check what is the problem.


