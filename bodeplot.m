function [yabs, yarg] = bodeplot (G, logminf, logmaxf)
% Plots a Bode diagram.
%
%   bodeplot (G, logminf, logmaxf)
%
% Arguments:
%
% - G is a transfer function, e.g.
%   G = @(s) 1./((1+3.*s).*(1+2*0.1*5.*s+25.*s.*s));
%   This transfer function must be defined before bodeplot is
%   called.
%
% - logminf and logmaxf are the minimum and maximum for the frequency
%   omega (in log(rad/s)).
%
% Example:
%
%   G = @(s) 1./((1+3.*s).*(1+2*0.1*5.*s+25.*s.*s));
%   bodeplot(G, -2, 1);

argd = @(x) (180/pi) * arg(x);
ticks = @(d,y) [floor(min(y)/d)*d:d:ceil(max(y)/d)*d];

omega = logspace(logminf, logmaxf, 1e4);
jomega = j * omega;

yabs = 20 * log10(abs(G(jomega)));
yarg = argd(G(jomega));

subplot(2, 1, 1);
semilogx(omega, yabs);
ylabel('Gain (db)');
grid on;
set(gca,'YTick', ticks(20, yabs));

subplot(2, 1, 2);
semilogx(omega, yarg);
xlabel('Frequency (Hz)');
ylabel('Phase (Hz)');
grid on;
set(gca, 'YTick', ticks(45, yarg));
