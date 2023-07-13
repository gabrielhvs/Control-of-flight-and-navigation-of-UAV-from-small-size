data = fopen('allPoints3d-perfect-21_06.csv');
A = textscan(data,'%s','Delimiter','\n');
B = A{1,1};
fclose(data);
Cx = textscan(B{1},'%s','Delimiter',',');
Cy = textscan(B{2},'%s','Delimiter',',');
Cz = textscan(B{3},'%s','Delimiter',',');

X=zeros(1,size(Cx{1},1)-2);
Y=zeros(1,size(Cy{1},1)-2);
Z=zeros(1,size(Cz{1},1)-2);
for i=1:size(Cx{1},1)-2
   
    X(i) = (str2double(Cx{1}{i})+str2double(Cx{1}{i+1})+str2double(Cx{1}{i+2}))/3;
    Y(i) = (str2double(Cy{1}{i})+str2double(Cy{1}{i+1})+str2double(Cy{1}{i+2}))/3;
    Z(i) = (str2double(Cz{1}{i})+str2double(Cz{1}{i+1})+str2double(Cz{1}{i+2}))/3;
    
end
Y = -(Y-1.655);

figure(1)

t = linspace(1,5,size(X,2));

pl  = polyfit(t,X,21);
p2  = polyfit(t,Y,21);
p3  = polyfit(t,Z,21);
X =  polyval(pl,t);
Y =  polyval(p2,t);
Z =  polyval(p3,t);

figure(3)
hold on
h=plot3(X(1:6500),Z(1:6500),Y(1:6500));
extraInputs = {'interpreter','latex','fontsize',18};
set(h,{'LineWidth'},{2});
axis equal
grid
for i=1:round(length(Y)/30):length(Y)
    %drawRobot(X(i),Z(i),Y(i),out.simout.Data(i,9),0.08);
end
legend('Posição do Drone')
title('Experimento - Controlador Implementado no Drone Físico',extraInputs{:})
xlabel('posição x(m)',extraInputs{:})
ylabel('posição y(m)',extraInputs{:})
zlabel('posição z(m)',extraInputs{:})
ax = gca; 
ax.FontSize = 16;

