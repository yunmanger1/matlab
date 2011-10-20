%% TSIS 02
% Tlepbergenova Zhazira

%% Mortgage payments
format; peryear = 1/12; percent = 1/100;
%%
% mounthly payments number of 30 years loan is
12*30

%%
% annual percentage rate of 8% comes out to a monthly rate
8*percent*peryear

%%
% P is the outstanding principal amount, that changes each mounth payment
% R is the mounthly payment, that remains constant during the life of the 
% loan. 
% J denotes mounthly interest rate
% m=J+1
% A is the initial amount.
syms m J P R A
P = A;
for n = 0:6,
disp([n, P]),
P = simplify(-R + P*m);
end

%%
% To solve for R, if loan is paid off in N istallments
syms N; solve(A*m^N - R*(m^N - 1)/(m - 1), R)

%%
R = subs(ans, m, J + 1)

%%
% For example, with an initial loan amount A = $150,000 and a loan lifetime
% of 30 years (360 payments), we get the following table of payment amounts
% as a function of annual interest rate:

format bank; disp(' Interest Rate       Payment')
for rate = 1:10,
disp([rate,double(subs(R,[A,N,J],[150000,360,rate*percent*peryear]))])
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
disp([rate,double(subs(ans,[R,N,m],[1500,360,1+rate*percent*peryear]))])
end
