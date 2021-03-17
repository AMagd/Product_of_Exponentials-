% Author ~ Ahmed Magd Aly
% Innopolis University

function Visualize(M, S, q)
% Forward Kinematics Function:

% q = deg2rad(q);

%% Moving to point 1:

O0 = eye(4);

O1 = FK(M(:,:,1), S(:,1:2), q(1:2));

O2 = FK(M(:,:,2), S(:,1:2), q(1:2));

O3 = FK(M(:,:,3), S(:,1:2), q(1:2));

O4 = FK(M(:,:,3), S(:,1:3), q(1:3));

O = round([O0 O1 O2 O3 O4], 10);

global axes_plot links_plot joints_plot end_effector_plot path_plot


enable_plot = 1;
if enable_plot
    % figure('units','normalized','outerposition',[0 0 1 1])
    


    as = 0.001; % axes scaler
    color = ['r','g','b']; % axes color
    
    index = 0;
    for i = 1:4:length(O)
        index = index + 1;
        points_x(index) = O(1,i+3);
        points_y(index) = O(2,i+3);
        points_z(index) = O(3,i+3);
        
        if index ~= 2 && index ~= 5
            for axes = 0:2
                
                axes_plot = [axes_plot plot3([O(1,i+3) as*O(1,i+axes)+O(1,i+3)], [O(2,i+3) as*O(2,i+axes)+O(2,i+3)], [O(3,i+3) as*O(3,i+axes)+O(3,i+3)],'Color',color(axes+1))];
                hold on
            end
        end
    end
    joints_x = [points_x(1:end)];
    joints_y = [points_y(1:end)];
    joints_z = [points_z(1:end)];
    
    links_plot = [links_plot plot3(points_x, points_y, points_z,'Color', 'k','linewidth',2)];
    hold on
    joints_plot = [joints_plot plot3(joints_x(1:end-1), joints_y(1:end-1), joints_z(1:end-1),'.','Color','0.992 0.788 0.04 1','MarkerSize',20)];
    hold on
    end_effector_plot = [end_effector_plot plot3(joints_x(end), joints_y(end), joints_z(end),'.','Color','0.8 0 0 1','MarkerSize',20)];
    path_plot = plot3(joints_x(end), joints_y(end), joints_z(end),'.','Color','r','MarkerSize',7.5);
    
    
%     xlim([-5 5])
%     ylim([-5 5])
%     zlim([-5 5])
    xlabel("X")
    ylabel("Y")
    zlabel("Z")
%     view(0,0)
    grid on
end