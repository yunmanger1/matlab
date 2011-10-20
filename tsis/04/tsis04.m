%% TSIS #4
% by German Ilyin

%% Population Dynamics
% r is "birth rate - death rate"
% to compute two populations with at five yaer intervals
% the first one is called "exponential growth" it hapens when r>0.
% the second one is called "exponential decay" it happens when r<0
r = 0.1; Xinit = 100; f = inline('x*(1 + r)', 'x', 'r');
X = itseq(f, Xinit, 100, r);
format long; X(1:5:101)

%%
r = -0.1; X = itseq(f, Xinit, 100, r);
X(1:5:101)

%%
% lets consider that the r is not costant, lets assume that population
% changes like "P at next generation" = u*P(1-P), where u=r+1
% so we set up new function f
clear f; f = inline('u*x*(1 - x)', 'x', 'u');

%%
% so P now changes like
u = 0.5; Xinit = 0.5; X = itseq(f, Xinit, 20, u); plot(X)
%%
u = 1; X = itseq(f, Xinit, 20, u); plot(X)
%%
u = 1.5; X = itseq(f, Xinit, 20, u); plot(X)
%%
u = 3.4; X = itseq(f, Xinit, 20, u); plot(X)
%%
% There are some rules about u(Logistic constant)
% (1) u can't be larger>4
u = 4.5; Xinit = 0.9; X = itseq(f, Xinit, 10, u)
%%
% (2) if 0<=u<1 then Population Density tends to 0
X = itseq(f, 0.75, 20, 1);
bar(X)
%%
% (3) if 1<u<=3 then the population will stabilize at density 1-1/u
X = itseq(f, 0.5, 20, 2.5);
plot(X)
%%
% (4) if 3<u<3.56994 then there is a periodic cycle
X = itseq(f, 0.75, 100, 3.5);
bar(X); axis([0 100 0 0.9])
%%
% (5) if 3.56994<u<4 then chaos ensues
X = itseq(f, 0.75, 100, 3.7); plot(X)
