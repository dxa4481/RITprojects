function [xc, yc, amp]  =  fit_star(img, xguess, yguess, ampguess) 

%%This program finds the best x, y and A fit for the guassian
%%Ae^-((x-x0)^2+(y-y0)^2/(2*(1.22)^2))

picture = imread(img);

picture=double(picture);


y=xguess;
x=yguess;
%this makes sure that the guess is not the same as a and b. Please don't
%put in an imaginary answer as your guess when you run this program.
a=i;
b=i;
%this is the part that finds the x and y
while x~=a && y~=b
    a=x;
    b=y;
    %as long as the thing increases it keeps going in that direction
    while picture(x,y)<=picture(x+1,y)
    
        x=1+x;
    end
    while picture(x,y)<=picture(x-1,y)
    
        x=x-1;
    end
    while picture(x,y)<=picture(x,y+1)
    
        y=y+1;
    end
    while picture(x,y)<=picture(x,y-1)
    
        y=y-1;
    end
    while picture(x,y)<=picture(x-1,y-1)
        x=x-1;
        y=y-1;
    end
    while picture(x,y)<=picture(x+1,y+1)
        x=x+1;
        y=y+1;
    end
    while picture(x,y)<=picture(x-1,y+1)
        x=x-1;
        y=y+1;
    end
    while picture(x,y)<=picture(x+1,y-1)
        x=x+1;
        y=y-1;
    end
end

%preallocated for speed
asdf=0;
Karray(255/.01)=0;
Aarray(255/.01)=0;

for A=0:.01:255
    
    Ksum=0;
    for loopvar=x-10:x+10
        for loopvar2=y-10:y+10
            %compares the guassuan to the picture, squares the comparison
            %and sums up all the pixels
            Ksum=(picture(loopvar,loopvar2)-(A*exp(-((loopvar-x)^2+(loopvar2-y)^2)/(2*1.22^2))))^2+Ksum;


        end
    end
    asdf=asdf+1;
            Karray(asdf)=Ksum;
            Aarray(asdf)=A;

end
asdf=1;
%finds the minimum ksum, i have avoided taking the derivative mwahahahaha
minvalue=min(Karray);
minvalue=double(minvalue);
while Karray(asdf)~=minvalue
%find the place in the array at that minumum
    asdf=asdf+1;

end
%uses that place to obtain the correct A
A=Aarray(asdf);
xc=y;
yc=x;
amp=A;
% disp(A)
% disp(xc)
% disp(yc)


%%%%bell and whistle

%    for loopvar=x-10:x+10
%         for loopvar2=y-10:y+10
% 
%             picture(loopvar,loopvar2)=(picture(loopvar,loopvar2)-(A*exp(-((loopvar-x)^2+(loopvar2-y)^2)/(2*1.22^2))));
% 
% 
%         end
%     end
%     uint8(picture);
%     image(picture)