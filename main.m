clear all
close all
clc

%% Robot parameters:

l1 = 0.25;
l2 = 0.5;
l3 = 0.75;

M = [1 0 0 0;
     0 1 0 l3;
     0 0 1 l1+l2;
     0 0 0 1];
 
S = [0 1 0;
     0 0 0;
     1 0 0;
     0 0 0;
     0 l1 1;
     0 0 0];

q = [0 0 0];

%% Testing the Forward Kinematics:
T = FK(M, S, q);

%% Testing the Jacobian:
J = Jac(S, q);

%% Visualize
Robot = figure();

global axes_plot links_plot joints_plot end_effector_plot
axes_plot = plot3(0,0,0);
hold on
links_plot = plot3(0,0,0);
hold on
joints_plot = plot3(0,0,0);
hold on
end_effector_plot = plot3(0,0,0);

M_visualize(:,:,1) = [1 0 0 0;
            0 1 0 0;
            0 0 1 l1;
            0 0 0 1];

M_visualize(:,:,2) = [1 0 0 0;
            0 1 0 0;
            0 0 1 l1+l2;
            0 0 0 1];
        
M_visualize(:,:,3) = [1 0 0 0;
            0 1 0 l3;
            0 0 1 l1+l2;
            0 0 0 1];

nPoints = 50;

for i = linspace(0, 2*pi, nPoints)
    if ~ishandle(Robot), return, end
        delete([links_plot,joints_plot,end_effector_plot])
        delete(axes_plot)
        
    q = [i 0 0];
    Visualize(M_visualize, S, q)
    
    drawnow
end