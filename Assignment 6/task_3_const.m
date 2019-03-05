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
D = tf(-Tl/r);

T = (H*G+F*G)/(1+H*G);
error = (D*G)/(1+H*G);

sys = [T, error;
       0, error];

%% sim
d = ones(1, length(t));
u = [theta_d; d];

[y,t] = lsim(sys, u, t);

% plot
if (~exist('plots/task3', 'dir')); mkdir plots task3; end
response = figure;
plot(t, u(1,:), t, y(:,1))
title('PD response with static disturbance')
xlabel('time')
ylabel('rad')
lgd = legend('$\theta^{d}$','$\theta$');
set(lgd,'FontSize',12,'FontAngle','italic','Interpreter','latex')
saveas(response, [pwd, '/plots/task3/const_response'], 'epsc');

error = figure;
plot(t, y(:,2))
title('PD error with static disturbance')
xlabel('time')
ylabel('rad')
lgd = legend('$e=\theta^{d}-\theta$');
set(lgd,'FontSize',12,'FontAngle','italic','Interpreter','latex')
saveas(error, [pwd, '/plots/task3/const_error'], 'epsc');