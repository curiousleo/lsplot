====================
Linear Systems Plots
====================

Plot Bode and Nyquist diagrams using Octave.

Bode Diagrams
=============

Define a transfer function and plot its Bode diagram::

  G = @(s) 1 ./ ((1 + 3.*s) .* (1 + 2*0.1*5.*s + 25.*s.*s));
  bodeplot(G, -2, 1);

Nyquist Diagrams
================

Define another transfer function and plot its Nyquist diagram::

  G = @(s) 7 ./ (1 + 2*0.1*5.*s + 25.*s.*s);
  nyquistplot(G);
