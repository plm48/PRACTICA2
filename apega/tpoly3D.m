function [ q,v,acc] = tpoly3D( qin,qout,t,vin,vout)

q=zeros(size(t));
v=zeros(size(t));
acc=zeros(size(t));
aux=1;
A = exist('vin');

if A==0
    
    for i=0:0.1:t(end)
        q(aux)=qin+(qout-qin)*(-2*(i/t(end))^3+3*(i/t(end))^2);
        v(aux)=(6*(qout-qin)*(-(i/t(end))^2+(i/t(end))))/t(end);
        acc(aux)=6*(qout-qin)*(-2*(i/t(end))+1);
        aux=aux+1;
    end
    
    
else

    c= (vin*t(end))/(qout-qin);
    b= 3-((2*vin+vout)*t(end))/(qout-qin);
    a= -2+(vin+vout)*t(end)/(qout-qin);
    
    for i=0:0.1:t(end)
        q(aux)=qin+(qout-qin)*(a*(i/t(end))^3+b*(i/t(end))^2+c*(i/t(end)));
        v(aux)=((qout-qin)*(3*a*(i/t(end))^2+2*b*(i/t(end))+c))/t(end);
        acc(aux)=((qout-qin)*(6*a*(i/t(end))+2*b))/(t(end)*2);
        aux=aux+1;
    end
    
end


end


