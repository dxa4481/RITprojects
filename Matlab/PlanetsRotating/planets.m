function planets ( ending_time,timestep)
%%
%ending_time is in days and timestep is in senconds 
%this program is a program that does some stuff with 9 bodies around the
% sun. It uses Eulers method to calculate things and has large errors when
% ran for long times.


%this takes the timestep in days and years total and turns them into seconds
years=ending_time*86400;


G=6.67300*10^-11;



% The general trend for all of these arrays goes as follows
% 
% array(1)=info about the sun
% array(2)=info about mercury
% array(3)=info about venus
% array(4)=info about earth
% array(5)=info about mars
% array(6)=info about jupiter
% array(7)=info about saturn
% array(8)=info about uranus
% array(9)=info about neptune
% array(10)=info about pluto



planetmass(1)=1.98892*10^30;
planetmass(2)=3.30200*10^23;
planetmass(3)=4.86900*10^24;
planetmass(4)=5.9742*10^24;
planetmass(5)=6.417*10^23;
planetmass(6)=1.899*10^27;
planetmass(7)=5.685*10^26;
planetmass(8)=8.682*10^25;
planetmass(9)=1.024*10^26;
planetmass(10)=1.3*10^22;

%saves computations later to multiply by G now
planetmass=planetmass*G;



planetx(1)=-4.173780072034275E-03;
planetx(2)=-3.254274813047346E-01;
planetx(3)=-5.422830038348582E-01;
planetx(4)=-1.757691570699245E-01;
planetx(5)=5.680571718217160E-01;
planetx(6)=4.901953649524238E+00;
planetx(7)=-9.415804070039412E+00;
planetx(8)=2.008289298043070E+01;
planetx(9)=2.543242295413326E+01;
planetx(10)=2.788035797450276E+00;
%scales au into meters
planetx=planetx*149597870700;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
planetvx(1)=8.230492550577723E-07;
planetvx(2)=-1.745330858881957E-02;
planetvx(3)=-1.345295870164601E-02;
planetvx(4)=-1.722543139856719E-02;
planetvx(5)=1.332175319379523E-02;
planetvx(6)=-1.081844011900388E-03;
planetvx(7)=7.310506583016966E-04;
planetvx(8)=2.987279739340398E-06;
planetvx(9)=1.645904065912284E-03;
planetvx(10)=3.193980463086972E-03;


planetvx=planetvx*1731458.33;





planety(1)=7.099593014214438E-04;
planety(2)=1.470377149611438E-01;
planety(3)=4.753132014458776E-01;
planety(4)=9.689784107710354E-01;
planety(5)=-1.290276309468262E+00;
planety(6)=6.492361425410386E-01;
planety(7)=-1.768790316993145E+00;
planety(8)=-1.626990475698014E-01;
planety(9)=-1.592871746992481E+01;
planety(10)=-3.172708940840107E+01;

planety=planety*149597870700;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
planetvy(1)=-6.168298835870542E-06;
planetvy(2)=-2.441610498768040E-02;
planetvy(3)=-1.527996051896081E-02;
planetvy(4)=-3.069797666532440E-03;
planetvy(5)=6.865622437572272E-03;
planetvy(6)=7.839399858800254E-03;
planetvy(7)=-5.494644595066728E-03;
planetvy(8)=3.749614174715089E-03;
planetvy(9)=2.679121207007654E-03;
planetvy(10)=-3.338074902443604E-04;

planetvy=planetvy*1731458.33;


planetz(1)=1.604504857505994E-05;
planetz(2)=4.144867298810978E-02;
planetz(3)=3.757371712506968E-02;
planetz(4)=-8.071357286641453E-06;
planetz(5)=-4.108701780941804E-02;
planetz(6)=-1.124667705413734E-01;
planetz(7)=4.054572475125180E-01;
planetz(8)=-2.607906257647571E-01;
planetz(9)=-2.580858664951978E-01;
planetz(10)=2.588529402409225E+00;

planetz=planetz*149597870700;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
planetvz(1)=-8.099453361184341E-09;
planetvz(2)=-3.928875849872461E-04;
planetvz(3)=5.672054215939561E-04;
planetvz(4)=-4.254847485630660E-07;
planetvz(5)=-1.831126449300740E-04;
planetvz(6)=-8.404735693140495E-06;
planetvz(7)=6.629310885757098E-05;
planetvz(8)=1.393893130105414E-05;
planetvz(9)=-9.328009914558260E-05;
planetvz(10)=-8.942698841985957E-04;

planetvz=planetvz*1731458.33;


%takes the total time and divides by the timestep to find the number of
%times to loop
loopnums=floor(years/timestep);



%these are preallocated for speed
netax(10)=0;
netay(10)=0;
netaz(10)=0;
r(10,10)=0;
a(10,10)=0;
%used for graphing
% bigplanetx(loopnums,10)=0;
% bigplanety(loopnums,10)=0;
% bigplanetz(loopnums,10)=0;


t=0;
%the main loop, this is howmany movements the objects make
for loopvar3 = 0 : loopnums
    %
    %the counter is for the chart below, it lets me only calculate symetrical
    %forces one time.
    counter=1;    
    %for energy
    %%%%%%%%%%%%
%     u=0;
    %%%%%%%%%%%
    t=loopvar3+t;
for loopvar = 1 : 10
    %for energy
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%             u=u+1/2*planetmass(loopvar)*(planetvx(loopvar)^2+planetvy(loopvar)^2+planetvz(loopvar)^2);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%            
    
%the acceloration is reset and summed each loop
netax(loopvar)=0;
netay(loopvar)=0;
netaz(loopvar)=0;
%the planets distance to the origin, used to scale the acceloration down
%below
rad=(planetx(loopvar)^2+planety(loopvar)^2+planetz(loopvar)^2)^.5;
counter=counter+1;
    %basicly this loop adds up all the forces BELOW the zero line on the
    %chart below
    for loopvar2 = counter:10

           %This is the r(loopvar,loopvar2) matrix and the normal matrix
           %trend for any other matricies used
        %                   loopvar
     %          sun  me  ve  ea  ma  ju  sa  ur  ne  pl 
   %loopvar2    -----------------------------------------             
        % sun  | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9
        % me   | 1 | 0 |10 |11 |12 |13 |14 |15 |16 |17
        % ve   | 2 |10 | 0 |18 |19 |20 |21 |22 |23 |24
        % ea   | 3 |11 |18 | 0 |25 |26 |27 |28 |29 |30
        % ma   | 4 |12 |19 |25 | 0 |31 |32 |33 |34 |35
        % ju   | 5 |13 |20 |26 |31 | 0 |36 |37 |38 |39
        % sa   | 6 |14 |21 |27 |32 |36 | 0 |40 |41 |42
        % ur   | 7 |15 |22 |28 |33 |37 |40 | 0 |43 |44
        % ne   | 8 |16 |23 |29 |34 |38 |41 |43 | 0 |45
        % pl   | 9 |17 |24 |30 |35 |39 |42 |44 |45 | 0
        r(loopvar,loopvar2)=((planetx(loopvar)-planetx(loopvar2))^2 +(planety(loopvar)-planety(loopvar2))^2+(planetz(loopvar)-planetz(loopvar2))^2);
        %symytry arguments from the above graph dictate the following must
        %be true. I've also left off the sqrt because it's just going to be
        %squared when I use it
        r(loopvar2,loopvar)=r(loopvar,loopvar2);
          
        
                %i'm scaling this a now so I don't have to do it 3 times
                %later
                a(loopvar,loopvar2)=(-planetmass(loopvar2)/(r(loopvar,loopvar2)))/rad;
                %you know what, for the life of me I can't figure out why I
                %can't scale this one ahead of time also, so I just sucked
                %it up and did it 3 times later.
                a(loopvar2,loopvar)=(-planetmass(loopvar)/(r(loopvar,loopvar2)));
                
                netax(loopvar)=netax(loopvar)+a(loopvar,loopvar2)*(planetx(loopvar));
                netay(loopvar)=netay(loopvar)+a(loopvar,loopvar2)*(planety(loopvar));
                netaz(loopvar)=netaz(loopvar)+a(loopvar,loopvar2)*(planetz(loopvar));
    %endfor
    
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%             u=u+planetmass(loopvar)*planetmass(loopvar2)/(G*r(loopvar,loopvar2));
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%        
            
    end        
    %this loop adds up all the forces ABOVE the zero line on the chart
    %above
    for loopvar2 = 1:counter-2
        
        
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%             u=u+planetmass(loopvar)*planetmass(loopvar2)/(G*r(loopvar,loopvar2));
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                
                
                netax(loopvar)=netax(loopvar)+a(loopvar,loopvar2)*(planetx(loopvar)/rad);
                netay(loopvar)=netay(loopvar)+a(loopvar,loopvar2)*(planety(loopvar)/rad);
                netaz(loopvar)=netaz(loopvar)+a(loopvar,loopvar2)*(planetz(loopvar)/rad);                     
    %endfor
    end   
    
    %eulers methode is here
  planetvy(loopvar)=netay(loopvar)*(timestep)+planetvy(loopvar);
  planetvx(loopvar)=netax(loopvar)*(timestep)+planetvx(loopvar);
  planetvz(loopvar)=netaz(loopvar)*(timestep)+planetvz(loopvar);                       
    %and here....
  planetx(loopvar)=planetvx(loopvar)*timestep+planetx(loopvar);
  planety(loopvar)=planetvy(loopvar)*timestep+planety(loopvar);
  planetz(loopvar)=planetvz(loopvar)*timestep+planetz(loopvar);

  if loopvar3/100==floor(loopvar3/100)

  fprintf(1, 'ID %f t %f x %f y %f z %f vx %f vy %f vz %f\n',loopvar-1,t,planetx(loopvar),planety(loopvar),planetz(loopvar),planetvx(loopvar),planetvy(loopvar),planetvz(loopvar));   
  end
  
%saving to graph later
% bigplanetx(loopvar3+1,loopvar)=planetx(loopvar);
% bigplanety(loopvar3+1,loopvar)=planety(loopvar);
% bigplanetz(loopvar3+1,loopvar)=planetz(loopvar);  
%endfor
end
% 
% if loopvar3==0
%     umax=u;
%     umin=u;
% end
% if u>umax
%     umax=u;
% end
% if u<umin
%     umin=u;
% end


%endfor
end
%energy error
% disp(1-umin/umax)
%the graph
%   plot3(bigplanetx,bigplanety,bigplanetz)
%   
  %used for a bell and whistle
% disp(planetx(4)/149597870700)
% disp(planety(4)/149597870700)
% disp(planetz(4)/149597870700)
% disp(planetvx(4)/1731458.33)
% disp(planetvy(4)/1731458.33)
% disp(planetvz(4)/1731458.33)


