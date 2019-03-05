run('constants.m')

%% Gains
K_d = 2*(2*zeta*omega) - 1;
K_p = 2*omega^2;
K_i = 500;

%% sim

if (~exist('plots/task5', 'dir')); mkdir plots task5; end

saturation = inf;

sim('task_5_const')
fig = figure;
plot(Scope.time, Scope.signals(1).values(), Scope.time, Scope.signals(2).values)
title('PID response with const. disturbance. No saturation.')
xlabel('time')
ylabel('rad')
lgd = legend('$\theta^{d}$','$\theta$');
set(lgd,'FontSize',12,'FontAngle','italic','Interpreter','latex')
saveas(fig, [pwd, '/plots/task5/const_no_sat'], 'epsc');

saturation = 20;

sim('task_5_const')
fig = figure;
plot(Scope.time, Scope.signals(1).values(), Scope.time, Scope.signals(2).values)
title('PID response with const. disturbance and saturation.')
xlabel('time')
ylabel('rad')
lgd = legend('$\theta^{d}$','$\theta$');
set(lgd,'FontSize',12,'FontAngle','italic','Interpreter','latex')
saveas(fig, [pwd, '/plots/task5/const_sat'], 'epsc');

saturation = inf;

sim('task_5_dynamic')
fig = figure;
plot(Scope.time, Scope.signals(1).values(), Scope.time, Scope.signals(2).values)
title('PID response with dynamic disturbance. No saturation.')
xlabel('time')
ylabel('rad')
lgd = legend('$\theta^{d}$','$\theta$');
set(lgd,'FontSize',12,'FontAngle','italic','Interpreter','latex')
saveas(fig, [pwd, '/plots/task5/dynamic_no_sat'], 'epsc');

saturation = 20;

sim('task_5_dynamic')
fig = figure;
plot(Scope.time, Scope.signals(1).values(), Scope.time, Scope.signals(2).values)
title('PID response with dynamic disturbance and saturation.')
xlabel('time')
ylabel('rad')
lgd = legend('$\theta^{d}$','$\theta$');
set(lgd,'FontSize',12,'FontAngle','italic','Interpreter','latex')
saveas(fig, [pwd, '/plots/task5/dynamic_sat'], 'epsc');