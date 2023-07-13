
load('teste_Eq_Model.mat')
figure(1)

p=plot(out.tout,out.yout(:,1),out.tout,out.yout(:,2),out.tout,out.yout(:,3),out.tout,out.yout(:,9));
extraInputs = {'interpreter','latex','fontsize',18};
title('Experimento Controlador aplicado no Modelo de Equação Diferencial',extraInputs{:})
ylabel('Posição(m)',extraInputs{:})
xlabel('Tempo(s)',extraInputs{:})
grid
legend(["Posição X", "Posição Y","Posição Z"])
p(1).LineWidth = 2;
p(2).LineWidth = 2;
p(3).LineWidth = 2;
ax = gca; 
ax.FontSize = 16; 

 stepinfo(out.yout(5000:12000,1),out.tout(1:7001),'SettlingTimeThreshold',0.02)
 %%
 
load('teste_Eq_Model_ori.mat')
figure(1)

p=plot(out.tout,out.yout(:,9));
extraInputs = {'interpreter','latex','fontsize',18};
title('Experimento Controlador aplicado no Modelo de Equação Diferencial - Degrau de Orientação',extraInputs{:})
ylabel('Orientação(rad)',extraInputs{:})
xlabel('Tempo(s)',extraInputs{:})
grid
legend(["Orintação Psi"])
p.LineWidth = 2;

ax = gca; 
ax.FontSize = 16; 

 stepinfo(out.yout(2000:4000,9),out.tout(1:2001),'SettlingTimeThreshold',0.02)
%%
load('teste_Eq_Model_Traj.mat')

figure(2)
hold on
h=plot3(out.yout(:,1),out.yout(:,2),out.yout(:,3));
extraInputs = {'interpreter','latex','fontsize',18};
set(h,{'LineWidth'},{2});
axis equal
grid
for i=1:round(length(out.yout(:,1))/50):length(out.yout(:,1))
    drawRobot(out.yout(i,1),out.yout(i,2),out.yout(i,3),out.yout(i,9),0.06);
end
legend('Posição do Drone')
title('Experimento Controlador aplicado no Modelo de Equação Diferencial - Trajetoria',extraInputs{:})
xlabel('posição x(m)',extraInputs{:})
ylabel('posição y(m)',extraInputs{:})
zlabel('posição z(m)',extraInputs{:})
ax = gca; 
ax.FontSize = 16; 
%%
load('teste_Model_Simul.mat')
figure(1)

p=plot(out.yout.Time,out.yout.Data(1,:),out.yout.Time,out.yout.Data(2,:),out.yout.Time,out.yout.Data(3,:));
extraInputs = {'interpreter','latex','fontsize',18};
title('Experimento Controlador aplicado no Modelo do Pacote Parrot Mambo',extraInputs{:})
ylabel('Posição(m)',extraInputs{:})
xlabel('Tempo(s)',extraInputs{:})
grid
legend(["Posição X", "Posição Y","Posição Z"])
p(1).LineWidth = 2;
p(2).LineWidth = 2;
p(3).LineWidth = 2;
ax = gca; 
ax.FontSize = 16; 

stepinfo(out.yout.Data(1,4500:10000),out.yout.Time,'SettlingTimeThreshold',0.02)
%%
load('teste_Model_Simul_circle.mat')

figure(3)
hold on
h=plot3(out.yout.Data(1,:),out.yout.Data(2,:),-out.yout.Data(3,:));
extraInputs = {'interpreter','latex','fontsize',18};
set(h,{'LineWidth'},{2});
axis equal
grid
for i=1:round(length(out.yout.Data(1,:))/50):length(out.yout.Data(1,:))
    drawRobot(out.yout.Data(1,i),out.yout.Data(2,i),-out.yout.Data(3,i),out.yout.Data(9,i),0.06);
end
legend('Posição do Drone')
title('Experimento Controlador aplicado no Modelo do Pacote Parrot Mambo - Trajetoria',extraInputs{:})
xlabel('posição x(m)',extraInputs{:})
ylabel('posição y(m)',extraInputs{:})
zlabel('posição z(m)',extraInputs{:})
ax = gca; 
ax.FontSize = 16; 

%%
load('teste_Model_Sensor.mat')
figure(1)

p=plot(out.yout.Time,out.yout.Data(:,1),out.yout.Time,out.yout.Data(:,2),out.yout.Time,out.yout.Data(:,3));
extraInputs = {'interpreter','latex','fontsize',18};
title('Experimento - Controlador Medições dos Sensores como Fechamento da Malha',extraInputs{:})
ylabel('Posição(m)',extraInputs{:})
xlabel('Tempo(s)',extraInputs{:})
grid
legend(["Posição X", "Posição Y","Posição Z"])
p(1).LineWidth = 2;
p(2).LineWidth = 2;
p(3).LineWidth = 2;
ax = gca; 
ax.FontSize = 16; 

%stepinfo(out.yout.Data(3,:),out.yout.Time,'SettlingTimeThreshold',0.02)

%%
load('teste_Model_Sensor_traj.mat')
figure(3)
hold on
h=plot3(out.yout.Data(:,1),out.yout.Data(:,2),-out.yout.Data(:,3));
extraInputs = {'interpreter','latex','fontsize',18};
set(h,{'LineWidth'},{2});
axis equal
grid
for i=1:round(length(out.yout.Data(:,1))/20):length(out.yout.Data(:,1))
    drawRobot(out.yout.Data(i,1),out.yout.Data(i,2),-out.yout.Data(i,3),out.yout.Data(i,9),0.06);
end
legend('Posição do Drone')
title('Experimento - Controlador Medições dos Sensores como Fechamento da Malha - Trajetoria',extraInputs{:})
xlabel('posição x(m)',extraInputs{:})
ylabel('posição y(m)',extraInputs{:})
zlabel('posição z(m)',extraInputs{:})
ax = gca; 
ax.FontSize = 16; 
%%

load('teste_Ros_Model.mat')
figure(3)
hold on
h=plot3(out.simout.Data(:,1),out.simout.Data(:,2),out.simout.Data(:,3));
extraInputs = {'interpreter','latex','fontsize',18};
set(h,{'LineWidth'},{2});
axis equal
grid
for i=1:round(length(out.simout.Data(:,1))/30):length(out.simout.Data(:,1))
    drawRobot(out.simout.Data(i,1),out.simout.Data(i,2),out.simout.Data(i,3),out.simout.Data(i,9),0.06);
end
legend('Posição do Drone')
title('Experimento - Controlador no modelo desenvolvido no Gazebo',extraInputs{:})
xlabel('posição x(m)',extraInputs{:})
ylabel('posição y(m)',extraInputs{:})
zlabel('posição z(m)',extraInputs{:})
ax = gca; 
ax.FontSize = 16; 

%%
load('teste_Ros_Model_Comun.mat')
figure(3)
hold on
h=plot3(out.simout.Data(:,1),out.simout.Data(:,2),out.simout.Data(:,3));
extraInputs = {'interpreter','latex','fontsize',18};
set(h,{'LineWidth'},{2});
axis equal
grid
for i=1:round(length(out.simout.Data(:,1))/30):length(out.simout.Data(:,1))
    drawRobot(out.simout.Data(i,1),out.simout.Data(i,2),out.simout.Data(i,3),out.simout.Data(i,9),0.06);
end
legend('Posição do Drone')
title('Experimento - Controlador no modelo desenvolvido no Gazebo - Erro de Comunicação',extraInputs{:})
xlabel('posição x(m)',extraInputs{:})
ylabel('posição y(m)',extraInputs{:})
zlabel('posição z(m)',extraInputs{:})
ax = gca; 
ax.FontSize = 16; 

%%

load('teste_Ros_Sensor_spire.mat')
figure(3)
hold on
Np=length(out.simout.Data(:,1));
h=plot3(out.simout.Data(2000:Np,1),out.simout.Data(2000:Np,2),out.simout.Data(2000:Np,3));
extraInputs = {'interpreter','latex','fontsize',18};
set(h,{'LineWidth'},{2});
axis equal
grid
for i=2000:round(length(out.simout.Data(2000:Np,1))/30):length(out.simout.Data(2000:Np,1))
    drawRobot(out.simout.Data(i,1),out.simout.Data(i,2),out.simout.Data(i,3),out.simout.Data(i,9),0.06);
end
legend('Posição do Drone')
title('Experimento - Controlador no modelo desenvolvido no Gazebo - Trajetoria Espira',extraInputs{:})
xlabel('posição x(m)',extraInputs{:})
ylabel('posição y(m)',extraInputs{:})
zlabel('posição z(m)',extraInputs{:})
ax = gca; 
ax.FontSize = 16; 

%%
load('teste_Ros_Sensor_circle.mat')

figure(3)
hold on
h=plot3(out.simout.Data(:,1),out.simout.Data(:,2),out.simout.Data(:,3));
extraInputs = {'interpreter','latex','fontsize',18};
set(h,{'LineWidth'},{2});
axis equal
grid
for i=1:round(length(out.simout.Data(:,1))/30):length(out.simout.Data(:,1))
    drawRobot(out.simout.Data(i,1),out.simout.Data(i,2),out.simout.Data(i,3),out.simout.Data(i,9),0.08);
end
legend('Posição do Drone')
title('Experimento - Controlador no modelo desenvolvido no Gazebo - Erro de Comunicação',extraInputs{:})
xlabel('posição x(m)',extraInputs{:})
ylabel('posição y(m)',extraInputs{:})
zlabel('posição z(m)',extraInputs{:})
ax = gca; 
ax.FontSize = 16; 

%%
load('teste_Ros_Sensor_circle.mat')
figure(1)

p=plot(out.simout.Time(1:800),out.simout.Data(1:800,3));
extraInputs = {'interpreter','latex','fontsize',18};
title('Experimento - Controlador no modelo desenvolvido no Gazebo - Analise da Decolagem',extraInputs{:})
ylabel('Posição(m)',extraInputs{:})
xlabel('Tempo(s)',extraInputs{:})
grid
legend(["Posição Z"])
p(1).LineWidth = 2;
ax = gca; 
ax.FontSize = 16; 

%% 
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


t = linspace(1,5,size(X,2));

pl  = polyfit(t,X,21);
p2  = polyfit(t,Y,21);
p3  = polyfit(t,Z,21);
X =  polyval(pl,t);
Y =  polyval(p2,t);
Z =  polyval(p3,t);

figure(3)
hold on
h=plot3(X(1:6500),Z(1:6500),1+Y(1:6500));
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

%%

data = fopen('allPoints3d_test4.csv');
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

hold on

plot(Z(1:11000))

t = linspace(1,5,size(X(1:11000),2));

pl  = polyfit(t,X(1:11000),27);
p2  = polyfit(t,Y(1:11000),27);
p3  = polyfit(t,Z(1:11000),27);
X1 =  polyval(pl,t);
Y1 =  polyval(p2,t);
Z1 =  polyval(p3,t);

plot(Z1)

%%
figure(3)
hold on
h=plot3(X1,Z1,Y1+1.655);
extraInputs = {'interpreter','latex','fontsize',18};
set(h,{'LineWidth'},{2});
axis equal
grid
for i=1:round(length(Y)/30):length(Y)
    %drawRobot(X(i),Z(i),Y(i),out.simout.Data(i,9),0.08);
end
legend('Posição do Drone')
title('Experimento - Comunicação usando pyparrot e ROS',extraInputs{:})
xlabel('posição x(m)',extraInputs{:})
ylabel('posição y(m)',extraInputs{:})
zlabel('posição z(m)',extraInputs{:})
ax = gca; 
ax.FontSize = 16;