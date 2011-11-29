function [yabs, yarg] = bodeplot (G, logminf, logmaxf, miny=0, maxy=0)
% Plots a Bode diagram.
%
%   bodeplot (G, logminf, logmaxf)
%   bodeplot (G, logminf, logmaxf, miny, maxy)
%
% Arguments:
%
% - G is a transfer function, e.g.
%   G = @(s) 1./((1+3.*s).*(1+2*0.1*5.*s+25.*s.*s));
%   This transfer function must be defined before bodeplot is
%   called.
%
% - logminf and logmaxf are the limits (in log10) for the frequency
%   omega.
%
% - miny and maxy are the limits for the y-axis of the Bode plot.
%
% Example:
%
%   G = @(s) 1./((1+3.*s).*(1+2*0.1*5.*s+25.*s.*s));
%   bodeplot(G, -2, 1, -60, 20);

argd = @(x) (180/pi) * arg(x);
% ticks = @(d,y) [floor(min(y)/d)*d:d:ceil(max(y)/d)*d];

omega = logspace(logminf, logmaxf, 1e4);
jomega = j * omega;

yabs = 20 * log10(abs(G(jomega)));
yarg = argd(G(jomega));

subplot(2, 1, 1);
semilogx(omega, yabs);
ylabel('Gain (db)');
grid on;
% set(gca,'YTick', ticks(20, yabs));
if miny != maxy
  axis([10^logminf, 10^logmaxf, miny, maxy]);
end

subplot(2, 1, 2);
semilogx(omega, yarg);
ylabel('Phase (deg)');
xlabel('Frequency (rad/sec)');
grid on;
% set(gca, 'YTick', ticks(90, yarg));
