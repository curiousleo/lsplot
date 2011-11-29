function [yre, yim] = nyquistplot (G, maxr=0, logminf=-5, logmaxf=5)
% Plots a Nyquist diagram.
%
%   nyquistplot (G);
%   nyquistplot (G, maxr);
%   nyquistplot (G, maxr, logminf, logmaxf);
%
% Arguments:
%
% - G is a transfer function. It must be defined before nyquistplot is
%   called.
%
% - maxr is the maximum radius you want to plot.
%
% - logminf and logmaxf are the limits (in log10) for the frequency
%   omega.
%
% Example:
%
%   G = @(s) 1./((1+3.*s).*(1+2*0.1*5.*s+25.*s.*s));
%   nyquistplot(G, 3);

jomega = j * logspace(logminf, logmaxf, 1e4);

yre = real(G(jomega));
yim = imag(G(jomega));

plot(yre, yim);
ylabel('Imaginary part');
xlabel('Real part');
grid on;
if maxr > 0
  axis([-maxr-1, maxr-1, -maxr, maxr], 'square');
else
  axis('auto', 'square');
end
