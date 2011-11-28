function [yabs, yarg, yre, yim] = doubleplot(G, logminf, logmaxf)
% Plots a Bode and a Nyquist diagram.
%
%   doubleplot (G, logminf, logmaxf)
%
% Arguments:
%
% - G is a transfer function, e.g.
%   G = @(s) 1./((1+3.*s).*(1+2*0.1*5.*s+25.*s.*s));
%   This transfer function must be defined before doubleplot is
%   called.
%
% - logminf and logmaxf are the minimum and maximum for the frequency
%   omega (in log(rad/s)).
%
% Example:
%
%   G = @(s) 1./((1+3.*s).*(1+2*0.1*5.*s+25.*s.*s));
%   doubleplot(G, -2, 1);

figure();
[yabs, yarg] = bodeplot(G, logminf, logmaxf);
figure();
[yre, yim] = nyquistplot(G, logminf, logmaxf);
