function []=drawRobot(x,y,z,q,s)
%
p=[ 1              1/7     
   -3/7            1       
   -5/7            6/7     
   -5/7            5/7     
   -3/7            2/7     
   -3/7            0       
   -3/7           -2/7     
   -5/7           -5/7     
   -5/7           -6/7     
   -3/7           -1       
    1             -1/7     
    1              1/7 ];
%
p=s*p;
p=[p,ones(length(p),1)];
r=[cos(q),sin(q);-sin(q),cos(q);x,y];
p=p*r;
%
X=p(:,1);
Y=p(:,2);

z = z*ones(1,size(X,1));

plot3(X,Y,z,'r-','LineWidth',2)
end

