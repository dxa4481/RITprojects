function jazz (nmax)




total=88400;
jazz1=wavread('jazz.wav');



    jazz=jazz1(1 : total);


an(nmax)=0;
newjazz(total)=0;
range=1:total;


for n = 1 : nmax

        temp=sin(range(:)*n).*(jazz(:));
        an(n)=an(n)+sum(temp);
        newjazz(:)=an(n)*sin(n*range(:))+newjazz(:);

end
newjazz=newjazz/max(newjazz);
wavwrite(newjazz,45000,'newjazz.wav')
plot(an)

