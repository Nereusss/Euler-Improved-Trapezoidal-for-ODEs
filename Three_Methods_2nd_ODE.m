% Three Methods to approximate the 2nd system

clc
clear 
close all

dt=.1; % time step

X=zeros(100,1); % initialize a 100 x 1 matrix for x values with all zero entries
Y=zeros(100,1); % initialize a 100 x 1 matrix for y values with all zero entries

X(1)=1; % initial condition for x
Y(1)=0; % initial condition for y

% Euler method
for i=2:100
    X(i)=X(i-1)+dt*(-Y(i-1)+X(i-1).*(-1+X(i-1).^2+Y(i-1).^2));
    Y(i)=Y(i-1)+dt*(X(i-1)+Y(i-1).*(-1+X(i-1).^2+Y(i-1).^2));
end

x1=X(48); % x(3pi/2) approximately corresponds to X(48);
y1=Y(48); % y(3pi/2) approximately corresponds to Y(48);

% Improved Euler method
for i=1:100
    X(i)=0; % reinitialize x values
    Y(i)=0; % reinitialize y values
end

X(1)=1; % initial condition for x
Y(1)=0; % initial condition for y

for i=2:100
    X(i)=X(i-1)+dt*(-Y(i-1)+X(i-1).*(-1+X(i-1).^2+Y(i-1).^2));
    Y(i)=Y(i-1)+dt*(X(i-1)+Y(i-1).*(-1+X(i-1).^2+Y(i-1).^2));
    
    X(i)=X(i-1)+(dt/2)*((-Y(i-1)+X(i-1).*(-1+X(i-1).^2+Y(i-1).^2))+(-Y(i)+X(i).*(-1+X(i).^2+Y(i).^2)));
    Y(i)=Y(i-1)+(dt/2)*((X(i-1)+Y(i-1).*(-1+X(i-1).^2+Y(i-1).^2))+(X(i)+Y(i).*(-1+X(i).^2+Y(i).^2)));
end

x2=X(48);
y2=Y(48);

% Trapezoidal Method
for i=1:100
    X(i)=0; % reinitialize x values
    Y(i)=0; % reinitialize y values
end

X(1)=1; % initial condition for x
Y(1)=0; % initial condition for y

for i=2:100
    X(i)=X(i-1)+(dt/2)*((-Y(i-1)+X(i-1).*(-1+X(i-1).^2+Y(i-1).^2))+(-Y(i)+X(i).*(-1+X(i).^2+Y(i).^2)));
    Y(i)=Y(i-1)+(dt/2)*((X(i-1)+Y(i-1).*(-1+X(i-1).^2+Y(i-1).^2))+(X(i)+Y(i).*(-1+X(i).^2+Y(i).^2)));
end

x3=X(48);
y3=Y(48);