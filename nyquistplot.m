function [yre, yim] = nyquistplot (G, logminf, logmaxf)
% Plots a Nyquist diagram.
%
%   nyquistplot (G, logminf, logmaxf)
%
% Arguments:
%
% - G is a transfer function, e.g.
%   G = @(s) 1./((1+3.*s).*(1+2*0.1*5.*s+25.*s.*s));
%   This transfer function must be defined before nyquistplot is
%   called.
%
% - logminf and logmaxf are the minimum and maximum for the frequency
%   omega (in rad/s).
%
% Example:
%
%   G = @(s) 1./((1+3.*s).*(1+2*0.1*5.*s+25.*s.*s));
%   nyquistplot(G, -1, 1);

omega = logspace(logminf, logmaxf, 1e4);
jomega = j * omega;

yre = real(G(jomega));
yim = imag(G(jomega));

plot(yre, yim);
ylabel('Imaginary part');
xlabel('Real part');
grid on;
axis('auto','square');
