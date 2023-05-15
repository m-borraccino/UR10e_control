%% PLOTS

% resolution of speed animation
res = 1;

% Getting Vectors from Sim
%e_out = out.e_q_out.Data.';
q_out = out.q_out.Data.';
xi_des_out = out.xi_des_out.Data.';
q_des_out = out.q_des_out.Data.';
t_out = out.tout.';

% post processing
[t_sim, q_sim] = adjust_time(t_out,q_out,res);
[~, q_sim_des] = adjust_time(t_out,q_des_out,res);

%%

%[1 -> PD]  [2 -> Computed Torque]
rob = 1;
if(rob == 1)
    robot = ur10e;
else
    robot = ur10e_bis;
end

plot_axes = 0;

f = figure;
f.Position = [699   106   560   420];
% f.WindowState = 'maximized';

rr = show(robot,q_sim(:,1),"PreservePlot",false);
hold on
t_xi = plot3(xi_des_out(1,:),xi_des_out(2,:),xi_des_out(3,:),'.r','MarkerSize',2);
t_h = text(0,0.5,0.2,['(' num2str(t_sim(1),'%4.2f') ')']);
title('Robot Animation')
axis([-0.2 1 -1 1 -0.5 1])
clear F;
 for i=1:1:size(t_sim,2)
%for i=1:1:400
    
    delete(t_h)
    t_h = text(0,0.5,0.2,['(' num2str(t_sim(i),'%4.2f') ')']);

 %   rr = show(robot,q_sim_des(:,i),"PreservePlot",false);
    
     rr = show(robot,q_sim(:,i),"PreservePlot",false);
    
    if rob == 1
       Tee = getTransform(ur10e,q_sim(:,i),'ee_link');
    else
       Tee = getTransform(ur10e_bis,q_sim(:,i),'body6');
    end
    
    plot3(Tee(1,4),Tee(2,4),Tee(3,4),'.b','MarkerSize',8);

    if plot_axes == 1
        linez=[Tee(1,4),Tee(1,4)+Tee(1,3)*.2;
               Tee(2,4),Tee(2,4)+Tee(2,3)*.2;
               Tee(3,4),Tee(3,4)+Tee(3,3)*.2]';
        plot3(linez(:,1),linez(:,2),linez(:,3),'-b')
        linex=[Tee(1,4),Tee(1,4)+Tee(1,1)*.2;
               Tee(2,4),Tee(2,4)+Tee(2,1)*.2;
               Tee(3,4),Tee(3,4)+Tee(3,1)*.2]';
        plot3(linex(:,1),linex(:,2),linex(:,3),'-r')
        liney=[Tee(1,4),Tee(1,4)+Tee(1,2)*.2;
               Tee(2,4),Tee(2,4)+Tee(2,2)*.2;
               Tee(3,4),Tee(3,4)+Tee(3,2)*.2]';
        plot3(liney(:,1),liney(:,2),liney(:,3),'-g')
    end
    
    F(i) = getframe(gcf) ;
    drawnow
    
end

%%
writerObj = VideoWriter('myVideo.avi');
writerObj.FrameRate = 5;
% set the seconds per image
% open the video writer
open(writerObj);
% write the frames to the video
for i=1:length(F)
    % convert the image to a frame
    frame = F(i) ;    
    writeVideo(writerObj, frame);
end
% close the writer object
close(writerObj);
