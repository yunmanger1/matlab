%% TSIS 01
% Tlepbergenova Zhazira

%% ONE 300-WATT BULB
% 300-watt bulb in the center of the room;

syms x y; illum = 300/(4*pi*((x-5)^2 + (y-2)^2 + 3^2))
ezcontourf(illum, [0 10 0 4]); colormap(gray);
axis equal tight

%% TWO 150-WATT BULBS
% two 150-watt bulbs in the room. Computing the optimal points

%%
% |Here we are to create an inline function from string. And we vectorize|
% |it, to be able to use it with vectors|
light2 = inline(vectorize('150/(4*pi*((x - d)^2 + (y - 2)^2 + 3^2))'), 'x', 'y', 'd')

%%
% generation of matrices for ij(nested) calculations. 
[X,Y] = meshgrid(0:0.1:10, 0:0.1:4); 
%%
% ploting the light intensity in the room.
contourf(light2(X, Y, 3) + light2(X, Y, 7), 20); axis equal tight
%%
% bulbs at (2,3) and (2,7)
contourf(light2(X, Y, 2) + light2(X, Y, 8), 20);
axis equal tight
%%
% bulbs at (2,1) and (2,7)
contourf(light2(X, Y, 1) + light2(X, Y, 9), 20);
axis equal tight
%%
% Plot the light intensity at the corner (0,0) on different positions of
% light bulbs, which are placed symmetrically.
d = 0:0.1:5; plot(d, light2(0, 0, d) + light2(0, 0, 10 - d))

%%
% Plot the light intensity at the corner (5,0) on different positions of
% light bulbs, which are placed symmetrically.
plot(d, light2(5, 0, d) + light2(5, 0, 10 - d))
%%
% plot both graphs to one to see the intersection
hold on; plot(d, light2(0, 0, d) + light2(0, 0, 10 - d));
hold off

%%
% Sum of intensities of two bulbs in corners subtract the sum of
% intensity of two bulbs in other corners must be zero at some point d
% d in [0..5]
syms d;
eqn = inline(char(light2(0, 0, d) + light2(0, 0, 10 - d) - light2(5, 0, d) - light2(5, 0, 10 - d)))
fzero(eqn, [0 5])
contourf(light2(X, Y, ans) + light2(X, Y, 10-ans), 20);

%% THREE 100-WATT BULBS
% 3 bulbs.
light3 = inline(vectorize('100/(4*pi*((x - d)^2 + (y - 2)^2 +3^2))'), 'x', 'y', 'd')
%%
% create a grid, plot simple positioning at (2, 1),(2,5),(2, 9)
[X,Y] = meshgrid(0:0.1:10, 0:0.1:4); contourf(light3(X, Y, 1) + light3(X, Y, 5) + light3(X, Y, 9), 20);
axis equal tight

%%
% plot intensities along the short wall, at different symmetrical
% positions of two other bulbs. The 3rd is placed in the center.
d = 0:0.1:5;
for x = 0:0.5:5
plot(d, light3(x, 0, d) + light3(x, 0, 5) + light3(x, 0, 10 - d))
hold on
end
hold off

%%
% from plot it's clear that most optimal positioning of two bulbs is to 
% place them just near the walls

light3(0, 0, 0) + light3(0, 0, 5) + light3(0, 0, 10)
contourf(light3(X, Y, 0) + light3(X, Y, 5) + light3(X, Y, 10), 20);




