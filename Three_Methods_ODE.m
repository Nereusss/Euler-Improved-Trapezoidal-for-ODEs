% Three Diffrent Methods to approximate ODEs

clc
clear
close all

dt = .1; % time step

X = zeros(100,1); % initialize a 100 x 1 matrix for x values with all zero entries
Y = zeros(100,1); % initialize a 100 x 1 matrix for y values with all zero entries

X(1) = 1; % initial condition for x
Y(1) = 0; % initial condition for y

% Euler method(Explict)
for i = 2:100
    X(i) = X(i-1)+dt*(-Y(i-1)+X(i-1).*(1-X(i-1).^2-Y(i-1).^2));
    Y(i) = Y(i-1)+dt*(X(i-1)+Y(i-1).*(1-X(i-1).^2-Y(i-1).^2));
end

x1 = X(48); % x(3pi/2) approximately corresponds to X(48) when one step stands for 0.1
y1 = Y(48); % y(3pi/2) approximately corresponds to Y(48) when one step stands for 0.1

% Improved Euler method(Explict)
for i=1:100
    X(i) = 0; % reinitialize x values
    Y(i) = 0; % reinitialize y values
end

X(1) = 1; % initial condition for x
Y(1) = 0; % initial condition for y

for i=2:100
    X(i) = X(i-1)+dt*(-Y(i-1)+X(i-1).*(1-X(i-1).^2-Y(i-1).^2));
    Y(i) = Y(i-1)+dt*(X(i-1)+Y(i-1).*(1-X(i-1).^2-Y(i-1).^2));
    
    X(i) = X(i-1)+(dt/2)*((-Y(i-1)+X(i-1).*(1-X(i-1).^2-Y(i-1).^2))+(-Y(i)+X(i).*(1-X(i).^2-Y(i).^2)));
    Y(i) = Y(i-1)+(dt/2)*((X(i-1)+Y(i-1).*(1-X(i-1).^2-Y(i-1).^2))+(X(i)+Y(i).*(1-X(i).^2-Y(i).^2)));
end

x2 = X(48);
y2 = Y(48);

% Trapezoidal Method(Implicit)
for i=1:100
    X(i) = 0; % reinitialize x values
    Y(i) = 0; % reinitialize y values
end

X(1) = 1; % initial condition for x
Y(1) = 0; % initial condition for y

% Since the trapezoidal method is implicit and non-linear, we have to have
% initial guesses for the x and y, and we could use Newton's method to
% estimate X(i+1) and Y(i+i) on the right hand side

for i=1:100
    
    % We take previous time step X(i) and Y(i) as our initial guesses for
    % X(i+1) and Y(i+1) and denote them as x and y
    x = X(i);
    y = Y(i);
    
    for k = 1:20
        % Newton's method to find X(i+1) and Y(i+1) on the right hand side
        x = x - (x-X(i)-(dt/2)*((-Y(i)+X(i).*(1-X(i).^2-Y(i).^2))+(-y+x.*(1-x.^2-y.^2))))/(1-(dt/2)*(1-3*x.^2-y.^2));
        y = y - (y-Y(i)-(dt/2)*((X(i)+Y(i).*(1-X(i).^2-Y(i).^2))+(x+y.*(1-x.^2-y.^2))))/(1-(dt/2)*(1-3*y.^2-x.^2));
    end
    
    % Iterate through Trapezoidal method and plug in the X(i+1) and Y(i+1)
    % we found in the previous Newton's method
    w = X(i)+(dt/2)*((-Y(i)+X(i).*(1-X(i).^2-Y(i).^2))+(-y+x.*(1-x.^2-y.^2)));
    v = Y(i)+(dt/2)*((X(i)+Y(i).*(1-X(i).^2-Y(i).^2))+(x+y.*(1-x.^2-y.^2)));
    
    X(i+1) = w;
    Y(i+1) = v;
    
end

x3 = X(48);
y3 = Y(48);

% Compare the approximation to the exact answer (0, -1)
diff_x_Euler = x1 - 0;
diff_x_Improved = x2 - 0;
diff_x_Trapezoidal = x3 - 0;

diff_y_Euler = y1 - (-1);
diff_y_Improved = y2 - (-1);
diff_y_Trapezoidal = y3 - (-1);
