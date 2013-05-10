function []  =  spring(k1,k2,k3,m1,m2,x1,v1,x2,v2,dt)




 
 x1log(100/dt)=0;
 x2log(100/dt)=0;

for time=1:dt:100

%switch these lines of code to go between sin restoring force and linear    
    a1=(-k1*sin(x1)-k2*sin(x1-x2))/m1;    
%    a1=(-k1*(x1)-k2*(x1-x2))/m1;    

%switch these lines of code to go between sin restoring force and linear  
    a2=(-k3*sin(x2)+k2*sin(x1-x2))/m2;
%    a2=(-k3*(x2)+k2*(x1-x2))/m2;    
    
    v1=v1+dt*a1;
    v2=v2+dt*a2;
    
    x1=x1+dt*v1;
    x2=x2+dt*v2;
    
    
    x1log(round(time/dt))=x1;
    x2log(round(time/dt))=x2;
    
    
    
    
end
    x1log=.5*x1log/max(x1log);
    x2log=.5*x2log/max(x2log);
    
    plot(x1log)
wavwrite(x1log+x2log,'superpositionwave')
wavwrite(x1log,'x1')
wavwrite(x2log,'x2')
           

