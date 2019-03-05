run('constants.m')

%% Gains
K_d = 2*(2*zeta*omega) - 1;
K_p = 2*omega^2;

%% System
% Plant
G = tf(1,[2 1 0]);      % G(s) = 1/(2*s^2 + s)

% PD controller
H = tf([K_d K_p],1);    % H(s) = K_p + K_d*s
% Feed forward
F = 1/G;                % F(s) = 1/G(s)

% Disturbance
D = tf([-J_l/r 0 0],1);

% The new plant given with the added disturbance
G_load = G/(1-G*D);

sys = (H*G_load+F*G_load)/(1+H*G_load);

%% sim
u = theta_d;
lsim(sys, u, t);
[y,t] = lsim(sys, u, t);

% plot
if (~exist('plots/task3', 'dir')); mkdir plots task3; end
response = figure;
plot(t, u, t, y)
title('PD response with dynamic disturbance')
xlabel('time')
ylabel('rad')
lgd = legend('$\theta^{d}$','$\theta$');
set(lgd,'FontSize',12,'FontAngle','italic','Interpreter','latex')
saveas(response, [pwd, '/plots/task3/dyn_response'], 'epsc');

error = figure;
plot(t, transpose(u)-y)
title('PD error with dynamic disturbance')
xlabel('time')
ylabel('rad')
lgd = legend('$e=\theta^{d}-\theta$');
set(lgd,'FontSize',12,'FontAngle','italic','Interpreter','latex')
saveas(error, [pwd, '/plots/task3/dyn_error'], 'epsc');