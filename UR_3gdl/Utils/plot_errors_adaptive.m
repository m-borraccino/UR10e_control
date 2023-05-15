%% PLOTS

f = figure;
% f.WindowState = 'maximized';

% Getting Vectors from Sim
e_out = out.e_q_out.Data.';
q_out = out.q_out.Data.';
xi_des_out = out.xi_des_out.Data.';
pi_tilde_out = out.pi_tilde_out.Data';
t_out = out.tout.';

% errors
h(1) = subplot(2,1,1);
hold on
plot(t_out,e_out);
legend('$e_1$','$e_2$','$e_2$','Interpreter','latex')
title('Errors')
xlabel('time [s]')
ylabel('[rad]')
axis([0 inf -0.15 0.15])

h(2) = subplot(2,1,2);
hold on
plot(t_out,pi_tilde_out);
leg = legend('$\tilde{\pi}_1$','$\tilde{\pi}_2$','$\tilde{\pi}_3$');
set(leg,'Interpreter','latex');
title('Parameter Errors')
xlabel('time [s]')
ylabel('[kg]')
% axis([0 inf -2 2])


saveas(f,'q_pi_errors.png')