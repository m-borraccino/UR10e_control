%% PLOTS

% resolution of speed animation
res = 0.5;

% Getting Vectors from Simulation output
%e_out = out.e_q_out.Data.';
q_out = out.q_out.Data.';
xi_des_out = out.xi_des_out.Data.';
q_des_out = out.q_des_out.Data.';
t_out = out.tout.';

% post processing
[t_sim, q_sim] = adjust_time(t_out,q_out,res);
[~, q_sim_des] = adjust_time(t_out,q_des_out,res);

%% Animation

% robot = ur10e;
robot = ur10e_bis;

f = figure;
% f.WindowState = 'maximized';

rr = show(robot,q_sim(:,1),"PreservePlot",false);
hold on
t_xi = plot3(xi_des_out(1,:),xi_des_out(2,:),xi_des_out(3,:),'.r','MarkerSize',2);
t_h = text(0,0.5,0.2,['(' num2str(t_sim(1),'%4.2f') ')']);
title('Robot Animation')
axis([-0.2 1 -1 1 -0.5 1])
clear F;
for i=1:1:size(t_sim,2)
% for i=1:1:400

    delete(t_h)
    t_h = text(0,0.5,0.2,['(' num2str(t_sim(i),'%4.2f') ')']);

    %rr1 = show(ur10e_bis,q_sim_des(:,i),"PreservePlot",false);
    rr = show(robot,q_sim(:,i),"PreservePlot",false);
    
    Tee = getTransform(ur10e_bis,q_sim(:,i),'body3');
    if i > 350
     plot3(Tee(1,4),Tee(2,4),Tee(3,4),'.b','MarkerSize',8);
    end
    F(i) = getframe(gcf) ;
    drawnow
    
end

writerObj = VideoWriter('myVideo.avi');
writerObj.FrameRate = 5;
% set the seconds per image
% open the video writer
open(writerObj);
% write the frames to the video
for i=350:3:length(F)
    % convert the image to a frame♣
    frame = F(i) ;    
    writeVideo(writerObj, frame);
end
% close the writer object
close(writerObj);

% fare che salva il video