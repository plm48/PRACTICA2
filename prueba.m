clear all
clc

qin=5;
qout=25;
t=0:0.1:3;
%[q,v,a]=tpoly3D(qin,qout,t,2,5);
[q,v,a]=tpoly3D(qin,qout,t);

figure(1)
plot(t,q);
figure(2)
plot(t,v);
figure(3)
plot(t,a)
