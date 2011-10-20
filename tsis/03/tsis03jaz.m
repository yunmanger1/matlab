%% TSIS 03
% Tlepbergenova Zhazira

%% Monte Carlo Simulation
% Consider a roulette game, where casino loses if player gueses right color
% on the field of 100 numbers, where 49 numbers are red, 50 numbers are
% black and 1 number is green. So simple analog
% the game, where casino loses if matlabs rand function
% generates a number greater than 0.51. To simulate 10 games lets do this
revenues = sign(0.51 - rand(1, 10))

%%
% profit of the casino in 100 games is
profit = sum(sign(0.51 - rand (1, 100)))

%%
% in 100 games house should win 51 times
% for the 10 trials of 100 games
profits = sum(sign(0.51 - rand(100, 10)))
%%
% we see, that there is sizable probability that the casino has lost money 
% in 100 games. To get an idea of how the net profit is likely to be
% distributed in general, we can repeat the experiment a large number of 
% times and make a histogram of the results.
% The following function computes the
% net profits for k different trials of n games each:
profits = inline('sum(sign(0.51 - rand(n, k)))', 'n', 'k')
%%
% histogram of the output of profits using n = 100 and k = 100.
hist(profits(100, 100), -40:2:40); axis tight
%%
% we see that, house likely will win money after 100 trials, but the chance 
% of the fall is big. To get better
% aproximation lets  try 1000 trials
hist(profits(100, 1000), -40:2:40); axis tight
%%
% in 10000 trials, we see, that histogram shapes like "bel curve". 
hist(profits(100, 10000), -40:2:40); axis tight

%%
% Now consider the net profit after 1000 games. We expect that casino
% will win 510 games. Start from 100 trials
hist(profits(1000, 100), -100:2:150); axis tight

%%
% Though the range of observed values for the profit after 1000 games is
% larger than the range for 100 games, the range of possible values is 10 
% times as large, so that relatively speaking the outcomes are closer 
% together than before. 
% After 1000 games the house is more likely to be ahead, but chance to be
% behind is still sizable. Let's repeat with 1000 trials.
hist(profits(1000, 1000), -100:2:150); axis tight

%%
% Though it is unlikely, the chances are not insignificant that the house 
% is behind by more than 50 units after 1000 games.
% Lets see what happens after 10000 games and 100 trials.
hist(profits(10000, 100), -200:25:600); axis tight
%%
% We see, that 100 trials of 10000 games is enough to realize that the 
% chance of the casino will be behind is not sizable.