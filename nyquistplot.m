function [yre, yim] = nyquistplot (G, minf, maxf)
% Plots a Nyquist diagram.
%
%   nyquistplot (G, minf, maxf)
%
% Arguments:
%
% - G is a transfer function, e.g.
%   G = @(s) 1./((1+3.*s).*(1+2*0.1*5.*s+25.*s.*s));
%   This transfer function must be defined before nyquistplot is
%   called.
%
% - minf and maxf are the minimum and maximum for the frequency omega
%   (in rad/s).
%
% Example:
%
%   G = @(s) 1./((1+3.*s).*(1+2*0.1*5.*s+25.*s.*s));
%   nyquistplot(G, -1, 1);

omega = linspace(minf, maxf, 1000);
jomega = i*omega;

yre = real(G(jomega));
yim = imag(G(jomega));

plot(yre,yim);
ylabel('Imaginary part');
xlabel('Real part');
grid on;
axis('auto','square');
