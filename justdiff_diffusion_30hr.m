close all;
clear variables;

% User-defined data
%-------------------------------------------------------------------------%
nx=33;                  % number of grid points along x
ny=33;                  % number of grid points along y
nstep=10 %300             % number of time steps
lengthx=1500;            % domain length along x [micron]
lengthy=1500;            % domain length along y [micron]
D=0.041;                % diffusion coefficient [micron2/s]
fin=1397286;                  % inlet value of f

% Pre-processing of user-defined data
%-------------------------------------------------------------------------%
% Calculate grid steps
hx=lengthx/(nx-1);      % grid step along x [m]
hy=lengthy/(ny-1);      % grid step along y [m] 

% Numerical setup: time step (stability conditions)
sigma = .1;                       % safety coefficient usually .05
dt_diff  = 1/4*min(hx^2, hy^2)/D;   % diffusion [s]
%dt_conv = 4*D/(u^2+v^2);            % convection [s]
dt = sigma*min(dt_diff)*10;   % time step [s]
%dt = (.8); 

% Memory allocation
f=zeros(nx,ny);     % current numerical solution
fo=zeros(nx,ny);    % previous numerical solution

% Dirichlet boundary conditions along the east side
f(nx, ny*1/3:(ny*2/3+1)) = fin; %f(nx, ny*1/3:(ny*2/3+1)) = fin;

% Definition of rectangular mesh (graphical purposes only)
xaxis = 0:hx:lengthx;
yaxis = 0:hy:lengthy;

% Video setup
%-------------------------------------------------------------------------%
% video_name = 'timetest1.mp4';
% videompg4 = VideoWriter(video_name, 'MPEG-4');
% open(videompg4);
% 
% Advancing in time
%-------------------------------------------------------------------------%

timearray{nstep,1} = zeros;
t = 0.;
for m=1:nstep
    
    % Plot the current solution
    hold off; 
    mesh(xaxis, yaxis, f'); 
    axis([0 lengthx 0 lengthy 0 2000000]);
    xlabel('x'); ylabel('y'); zlabel('f');
    message = sprintf('time=%d\n', t);
    time = annotation('textbox',[0.15 0.8 0.15 0.15],'String',message,'EdgeColor','none');
    frame = getframe(gcf);
%     writeVideo(videompg4,frame);
    timearray{m} = message;
    delete(time); 

    % Forward Euler method
    fo=f;
    for i=2:nx-1
        for j=2:ny-1
            f(i,j) = fo(i,j)...
                    -(0)...
                    -(0)...
                    +(D*dt/hx^2)*(fo(i+1,j)-2*fo(i,j)+fo(i-1,j))...
                    +(0);
        end
    end   
    
    % Boundary conditions (Neumann's only)
    f(1:nx,1)=fo(1:nx,2);        % south
    f(1:nx,ny)=fo(1:nx,ny-1);    % north
    f(1,1:ny)=fo(2,1:ny);        % west
    
    % New time step
    t=t+dt;
    
end
concens = f(:,20);
nxx = lengthx/nx
distance = (0:nxx:lengthx-1);
con_dis = [concens(:), distance(:)];
writematrix(con_dis, 'diff_justdiffusion.csv')


% Closing the video stream
% close(videompg4);