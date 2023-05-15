%% PLOTS

f = figure;
% f.WindowState = 'maximized';

% Getting Vectors from Sim
e_out = out.e_q_out.Data.';
e_out = out.e_x.Data.';
q_out = out.q_out.Data.';
xi_des_out = out.xi_des_out.Data.';
t_out = out.tout.';

% errors
hold on
plot(t_out,e_out);
legend('$e_1$','$e_2$','$e_3$','Interpreter','latex')
title('Errors')

title('Joint Angle Error')
xlabel('time [s]')
ylabel('[rad]')
axis([0 inf -0.5 0.5])

saveas(f,'q_errors.png')