%% TSIS #2
% by German Ilyin

%% Mortgage payments
peryear = 1/12; percent = 1/100;
%%
% number of mountly payments during 30 years is
12*30

%%
% mounthly rate of anual percentage rate of 8%
8*percent*peryear

%%
% outstanding principal amount P changes after each mounth payment, but
% mounthly payment R remains constant over the life of the loan. J denotes
% mounthly interest rate, m=J+1 and A is the initial amount.
syms m J P R A
P = A;
for n = 0:6,
disp([n, P]),
P = simplify(-R + P*m);
end

%%
% To solve for R, if load is paid off in N istallments
syms N; solve(A*m^N - R*(m^N - 1)/(m - 1), R)
%%
R = subs(ans, m, J + 1)

%%
% For example, with an initial loan amount A = $150,000 and a loan lifetime
% of 30 years (360 payments), we get the following table of payment amounts
% as a function of annual interest rate:

format bank; disp(' Interest Rate       Payment')
for rate = 1:10,
disp([rate, double(subs(R, [A, N, J], [150000, 360,...
rate*percent*peryear]))])
end

%%
% Lets determine the amount of money A that one can borrow, if he mounthly 
% is able to pay R
syms R; solve(A*m^N - R*(m^N - 1)/(m-1), A)

%%
% For example, if one is shopping for a house and can afford to pay $1500
% per month for a 30-year fixed-rate mortgage, the maximum loan amount as a
% function of the interest rate is given by

format bank; disp(' Interest Rate      Loan Amt.')
for rate = 1:10,
disp([rate, double(subs(ans, [R, N, m], [1500, 360,...
1 + rate*percent*peryear]))])
end
