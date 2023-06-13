%% Metrics Signals

%% Transfer Function
w2 = 0.0075; w3 = 0.0075; w4 = 0.00075;
g = 9.31;
m = 0.063;
l = 0.0624*2;
Jx = 5.82857e-5;
Jy = 7.169148e-5;
Jz = 1e-4;
K4 = -8; K3 = -8; K2 = -8;
k1 = 0.1; k2=0.1; k3=0.1;
b = 0.5;

s = tf('s');

Yaw = w2/(w2-((Jx*K2)/l)*s+(Jx/l)*s^2)

X = k2/(k2+b*s+s^2);

[y,t] = step(Yaw);
stepinfo(y, t)

plot(y)


%% Get out signal of simulink
out = sim('feedbackLin_Eq_Model.slx');

t = out.yout{1}.Values.Time;

x = out.yout{2}.Values.Data(:,1);
y = out.yout{2}.Values.Data(:,2);
z = out.yout{2}.Values.Data(:,3);

yaw = out.yout{1}.Values.Data(:,3);

stepinfo(x, t-50)
stepinfo(y, t-30)
stepinfo(z, t-5)
stepinfo(yaw, t-100)





