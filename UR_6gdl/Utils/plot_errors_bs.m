%% PLOTS pose error = euler xyz angles

f = figure;
f.Position = [500 610 930 370];
% f.WindowState = 'maximized';

% Getting Vectors from Sim
e_out = out.e_x.Data.';
q_out = out.q_out.Data.';
xi_des_out = out.xi_des_out.Data.';
t_out = out.tout.';

% errors
h(1) = subplot(2,1,1);
hold on
plot(t_out,e_out(1:3,:));
legend('$e_x$','$e_y$','$e_z$','Interpreter','latex')
title('Position Errors')
xlabel('time [s]')
ylabel('[m]')
% axis([0 inf -0.15 0.15])

h(2) = subplot(2,1,2);
hold on
plot(t_out,e_out(4:6,:));
leg = legend('$\phi$','$\theta$','$\psi$');
set(leg,'Interpreter','latex');
title('Euler XYZ Errors (end-effector pose)')
xlabel('time [s]')
ylabel('[rad]')
% axis([0 inf -pi pi])


saveas(f,'bs_errors.png')

%% PLOTS pose error = quuaternion

f = figure;
f.Position = [500 610 930 370];
% f.WindowState = 'maximized';

% Getting Vectors from Sim
e_out = out.e_xo.Data.';
q_out = out.q_out.Data.';
xi_des_out = out.xi_des_out.Data.';
t_out = out.tout.';

% errors
h(1) = subplot(2,1,1);
hold on
plot(t_out,e_out(1:3,:));
legend('$e_x$','$e_y$','$e_z$','Interpreter','latex')
title('Position Errors')
xlabel('time [s]')
ylabel('[m]')
% axis([0 inf -0.15 0.15])

h(2) = subplot(2,1,2);
hold on
plot(t_out,e_out(4:6,:));
leg = legend('$e_1$','$e_2$','$e_3$');
set(leg,'Interpreter','latex');
title('Pose error in quaternion parametrization (end-effector pose)')
xlabel('time [s]')
% ylabel('[rad]')
% axis([0 inf -pi pi])


saveas(f,'bs_errors2.png')