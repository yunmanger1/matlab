%% TSIS 04
% Tlepbergenova Zhazira

%% Population Dynamics
% r is the difference of birth rate and death rate
% lets compute two populations in 5 yars
% this one is "exponential growth" it apears when r>0.
r = 0.1; Xinit = 100; f = inline('x*(1 + r)', 'x', 'r');
X = itseq(f, Xinit, 100, r);
format long; X(1:5:101)

%%
% and this one is "exponential decay" it apears when r<0
r = -0.1; X = itseq(f, Xinit, 100, r);
X(1:5:101)

%%
% when r=0, the population remains constant
%
%
% in real life the r is not costant. So, let's assume that population
% changes like "P[n+1]" = u*P[n]*(1-P[n]), u=r+1
% so function f will be
clear f; f = inline('u*x*(1 - x)', 'x', 'u');

%%
% population now changes like
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
% (2) if 0<=u<1 then Population Density tends to 0, for any initial
% configuration
X = itseq(f, 0.75, 20, 1);
bar(X)
%%
% (3) if 1<u<=3 then the population will stabilize at density 1-1/u, for
% any initial density other than 0
X = itseq(f, 0.5, 20, 2.5);
plot(X)
%%
% (4) if 3<u<3.56994 then there is a periodic cycle appears
X = itseq(f, 0.75, 100, 3.5);
bar(X); axis([0 100 0 0.9])
%%
% (5) there is a value u<4 beyond which chaos ensues
X = itseq(f, 0.75, 100, 3.7); plot(X)
