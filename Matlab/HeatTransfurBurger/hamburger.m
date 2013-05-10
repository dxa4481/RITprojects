function [temp_array]  =  hamburger(nx, ny, nz, Tgrill, duration, timestep)


%%this program take a burger, cooks it on a grill and outputs the
%temperature of each part of the burger. The burger is .15 meters by .15
%meters by .01 meters. The inputs nx ny and nz allow you to split these
%dimensions up into n divisions. The Tgrill is the temperature of the grill
%in degrees C. The Duration is in seconds, the timestep is also in seconds
%I should warn you this program requires a lot of memory allocation...
%
%
%
%


K = 0.5;
%density
p = 950;
%specific heat
sheat = 3000;
k = 1.75*10^(-7);
%stephon boltzman constant
stephen = 5.670373*10^-8;

dx=.15/nx;
dy=.15/ny;
dz=.01/nz;

 theburger(nx,ny,nz)=0;
 thenewburger(nx,ny,nz)=0;
 
 theburger(:,:,1)=0;
 theburger(2,2,2)=0;

 
 
 massheat=dx*dy*dz*p*sheat;
 
 
             radheatfromzisnz(nx,ny,nz)=0;
            radheatfromxisnx(nx,ny,nz)=0;
            radheatfromxisone(nx,ny,nz)=0;
            radheatfromyisny(nx,ny,nz)=0;
            radheatfromyisone(nx,ny,nz)=0;
 
 
 loopupto=round(duration/timestep);

 
 %for bell and whistle
%  this=1;

%WHOLE PROGRAM IS IN ONE LOOP, BEAT THAT.
 for time=1:loopupto
     %here i shifted the matrix over up down left right back and forth.
     %This is so i can perform operations on the entire matrix and the
     %entire n+1 and n-1 of the matrix. This lets me skip looping through
     %each x y and z
theshiftedxplus=circshift(theburger,[-1,0,0]);
theshiftedxminus=circshift(theburger,[1,0,0]);
theshiftedyplus=circshift(theburger,[0,-1,0]);
theshiftedyminus=circshift(theburger,[0,1,0]);
theshiftedzplus=circshift(theburger,[0,0,-1]);
theshiftedzminus=circshift(theburger,[0,0,1]);    
            %this code works, it's the whole burger wrapped around itself i
            %have deleted it, but in a universe which is only burger which
            %wraps back into its burger self... this line of code could be
            %useful
%           thenewburger(:,:,:)=k*((theshiftedxplus(:,:,:)+theshiftedxminus(:,:,:)-2*theburger(:,:,:))/(dx^2))*timestep+k*((theshiftedyplus(:,:,:)+theshiftedyminus(:,:,:)-2*theburger(:,:,:))/(dy^2))*timestep+k*((theshiftedzplus(:,:,:)+theshiftedzminus(:,:,:)-2*theburger(:,:,:))/(dz^2))*timestep;
%%%%%%%%%%%so these are all the heat fluxes from each side
            heatfromupx(:,:,:)=(-K*timestep*(theburger(:,:,:)-theshiftedxplus(:,:,:))/(sheat*p*dx^2));
            heatfromdownx(:,:,:)=(-K*timestep*(theburger(:,:,:)-theshiftedxminus(:,:,:))/(sheat*p*dx^2));
            heatfromupy(:,:,:)=(-K*timestep*(theburger(:,:,:)-theshiftedyplus(:,:,:))/(sheat*p*dy^2));
            heatfromdowny(:,:,:)=(-K*timestep*(theburger(:,:,:)-theshiftedyminus(:,:,:))/(sheat*p*dy^2));
            heatfromupz(:,:,:)=(-K*timestep*(theburger(:,:,:)-theshiftedzplus(:,:,:))/(sheat*p*dz^2));
            heatfromdownz(:,:,:)=(-K*timestep*(theburger(:,:,:)-theshiftedzminus(:,:,:))/(sheat*p*dz^2));    
            heatfromgrill(:,:,1)=(-K*timestep*(theburger(:,:,1)-Tgrill)/(sheat*p*dz^2)); 
%%%%%%%%%%%black body radiation
            radheatfromzisnz(:,:,nz)=dx*dy*stephen*timestep*((7.3701e+009)-(theburger(:,:,nz)+273).^4)/massheat;
            radheatfromxisnx(nx,:,:)=dz*dy*stephen*timestep*((7.3701e+009)-(theburger(nx,:,:)+273).^4)/massheat;
            radheatfromxisone(1,:,:)=dz*dy*stephen*timestep*((7.3701e+009)-(theburger(1,:,:)+273).^4)/massheat;
            radheatfromyisny(:,ny,:)=dz*dx*stephen*timestep*((7.3701e+009)-(theburger(:,ny,:)+273).^4)/massheat;
            radheatfromyisone(:,1,:)=dz*dx*stephen*timestep*((7.3701e+009)-(theburger(:,1,:)+273).^4)/massheat;

     
            
 %%%%%%%%%%%%%%%%this calculates the whole burgers change in heat without boundry conditions           
            thenewburger(:,:,:)=heatfromupx(:,:,:)+heatfromdownx(:,:,:)+heatfromupy(:,:,:)+heatfromdowny(:,:,:)+heatfromupz(:,:,:)+heatfromdownz(:,:,:);            
            %%%%%%%%%%%%%%%%%%%%%%%below this line are the planes, should be 6           
            thenewburger(:,:,1)=thenewburger(:,:,1)-heatfromdownz(:,:,nz)+heatfromgrill(:,:,1);
            thenewburger(nx,:,:)=thenewburger(nx,:,:)-heatfromupx(nx,:,:)+radheatfromxisnx(nx,:,:);
            thenewburger(1,:,:)=thenewburger(1,:,:)-heatfromdownx(1,:,:)+radheatfromxisone(1,:,:);
            thenewburger(:,ny,:)=thenewburger(:,ny,:)-heatfromupy(:,ny,:)+radheatfromyisny(:,ny,:);
            thenewburger(:,1,:)=thenewburger(:,1,:)-heatfromdowny(:,1,:)+radheatfromyisone(:,1,:);
            thenewburger(:,:,nz)=thenewburger(:,:,nz)-heatfromupz(:,:,nz)+radheatfromzisnz(:,:,nz);
            

% %%%%%%%%%%%%%%below this line are the lines, should be 12
            thenewburger(1,1,:)=heatfromupx(1,1,:)+heatfromupy(1,1,:)+heatfromupz(1,1,:)+heatfromdownz(1,1,:)+radheatfromxisone(1,1,:)+radheatfromyisone(1,1,:);
            thenewburger(:,1,1)=heatfromupy(:,1,1)+heatfromupz(:,1,1)+heatfromupx(:,1,1)+heatfromdownx(:,1,1)+radheatfromyisone(:,1,1)+heatfromgrill(:,1,1);
            thenewburger(1,:,1)=heatfromupx(1,:,1)+heatfromupy(1,:,1)+heatfromdowny(1,:,1)+radheatfromxisone(1,:,1)+heatfromupz(1,:,1)+heatfromgrill(1,:,1);
            thenewburger(nx,:,1)=heatfromdownx(nx,:,1)+radheatfromxisnx(nx,:,1)+heatfromupy(nx,:,1)+heatfromdowny(nx,:,1)+heatfromupz(nx,:,1)+heatfromgrill(nx,:,1);
            thenewburger(nx,1,:)=heatfromdownx(nx,1,:)+radheatfromxisnx(nx,1,:)+radheatfromyisone(nx,1,:)+heatfromupz(nx,1,:)+heatfromdownz(nx,1,:)+heatfromupy(nx,1,:);
            thenewburger(:,ny,1)=heatfromdowny(:,ny,1)+radheatfromyisny(:,ny,1)+heatfromupx(:,ny,1)+heatfromdownx(:,ny,1)+heatfromupz(:,ny,1)+heatfromgrill(:,ny,1);


            
            
            
            thenewburger(1,ny,:)=heatfromupx(1,ny,:)+heatfromdowny(1,ny,:)+radheatfromxisone(1,ny,:)+radheatfromyisny(1,ny,:)+heatfromdownz(1,ny,:)+heatfromupz(1,ny,:);
            thenewburger(:,1,nz)=heatfromupx(:,1,nz)+heatfromdownx(:,1,nz)+heatfromupy(:,1,nz)+radheatfromyisone(:,1,nz)+radheatfromzisnz(:,1,nz)+heatfromdownz(:,1,nz);
            thenewburger(1,:,nz)=heatfromupx(1,:,nz)+radheatfromxisone(1,:,nz)+radheatfromzisnz(1,:,nz)+heatfromupy(1,:,nz)+heatfromdowny(1,:,nz)+heatfromdownz(1,:,nz);
            thenewburger(:,ny,nz)=heatfromdowny(:,ny,nz)+radheatfromzisnz(:,ny,nz)+radheatfromyisny(:,ny,nz)+heatfromupx(:,ny,nz)+heatfromdownx(:,ny,nz)+heatfromdownz(:,ny,nz);
            thenewburger(nx,:,nz)=heatfromdownx(nx,:,nz)+radheatfromxisnx(nx,:,nz)+heatfromupy(nx,:,nz)+heatfromdowny(nx,:,nz)+radheatfromzisnz(nx,:,nz)+heatfromdownz(nx,:,nz);
            thenewburger(nx,ny,:)=heatfromdownx(nx,ny,:)+heatfromdowny(nx,ny,:)+radheatfromxisnx(nx,ny,:)+radheatfromyisny(nx,ny,:)+heatfromdownz(nx,ny,:)+heatfromupz(nx,ny,:);


% %%%%%%%%%%%%%%below this line are the corners, should be 8

             thenewburger(nx,ny,1)=heatfromupz(nx,ny,1)+radheatfromyisny(nx,ny,1)+radheatfromxisnx(nx,ny,1)+heatfromdownx(nx,ny,1)+heatfromdowny(nx,ny,1)+heatfromgrill(nx,ny,1);
             thenewburger(nx,1,nz)=radheatfromyisone(nx,1,nz)+radheatfromxisnx(nx,1,nz)+radheatfromzisnz(nx,1,nz)+heatfromdownx(nx,1,nz)+heatfromupy(nx,1,nz)+heatfromdownz(nx,1,nz);
             thenewburger(1,ny,nz)=radheatfromyisny(1,ny,nz)+radheatfromxisone(1,ny,nz)+radheatfromzisnz(1,ny,nz)+heatfromupx(1,ny,nz)+heatfromdowny(1,ny,nz)+heatfromdownz(1,ny,nz);
             thenewburger(1,1,nz)=radheatfromyisone(1,1,nz)+radheatfromxisone(1,1,nz)+radheatfromzisnz(1,1,nz)+heatfromupx(1,1,nz)+heatfromupy(1,1,nz)+heatfromdownz(1,1,nz);
             thenewburger(1,ny,1)=heatfromupz(1,ny,1)+radheatfromyisny(1,ny,1)+radheatfromxisone(1,ny,1)+heatfromupx(1,ny,1)+heatfromdowny(1,ny,1)+heatfromgrill(1,ny,1);
             thenewburger(nx,1,1)=heatfromupz(nx,1,1)+radheatfromyisone(nx,1,1)+radheatfromxisnx(nx,1,1)+heatfromdownx(nx,1,1)+heatfromupy(nx,1,1)+heatfromgrill(nx,1,1);
             thenewburger(1,1,1)=heatfromupz(1,1,1)+radheatfromyisone(1,1,1)+radheatfromxisone(1,1,1)+heatfromupx(1,1,1)+heatfromupy(1,1,1)+heatfromgrill(1,1,1);
             thenewburger(nx,ny,nz)=radheatfromyisny(nx,ny,nz)+radheatfromxisnx(nx,ny,nz)+radheatfromzisnz(nx,ny,nz)+heatfromdownx(nx,ny,nz)+heatfromdowny(nx,ny,nz)+heatfromdownz(nx,ny,nz);

            
            theburger=theburger+thenewburger;
            %this is question 2
%             if theburger(floor(nx/2),floor(ny/2),floor(nz/2))>55
%                 disp(theburger)
%                 disp(timestep*time)
%                 while 1==1
%                 end
%             end

%           The flip bell and whistle
%             if timestep*time/3>loopupto && this==1
%                 this=0;
%                 theburger=flipdim(theburger,3);
%             end
%             
%               if 2*timestep*time/3>loopupto && this==0
%                 this=5;
%                 theburger=flipdim(theburger,3);
%             end          

%               theburger=flipdim(theburger,3);  
end
           

temp_array=theburger;
