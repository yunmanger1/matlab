%% ONE 300-WATT BULB
% Putting 300-watt bulb in the center of the room;

syms x y; illum = 300/(4*pi*((x-5)^2 + (y-2)^2 + 3^2))
ezcontourf(illum, [0 10 0 4]); colormap(gray);
axis equal tight

%% TWO 150-WATT BULBS
% Putting tow 150-bulbs in the room. Finding the optimal points

%%
% |Here we have create an inline function from string. And we vectorize|
% |it, to be able to use it with vectors|
light2 = inline(vectorize('150/(4*pi*((x - d)^2 + (y - 2)^2 + 3^2))'), 'x', 'y', 'd')

%%
% This generates matrices for ij(nested) calculations. 
[X,Y] = meshgrid(0:0.1:10, 0:0.1:4); 
%%
% This will plot the light intensity in the room.
contourf(light2(X, Y, 3) + light2(X, Y, 7), 20); axis equal tight
%%
% Put bulbs at points (2,3) and (2,7)
contourf(light2(X, Y, 2) + light2(X, Y, 8), 20);
axis equal tight
%%
% Put bulbs at points (2,1) and (2,7)
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
% plot both graphs at once, and see the intersection
hold on; plot(d, light2(0, 0, d) + light2(0, 0, 10 - d));
hold off

%%
% Here we create an equation. Sum of intensity of two corners minus sum of
% intensity of two other corners must be zero at some point d in range from
% 0 to 5
syms d;
eqn = inline(char(light2(0, 0, d) + light2(0, 0, 10 - d) - light2(5, 0, d) - light2(5, 0, 10 - d)))
fzero(eqn, [0 5])
contourf(light2(X, Y, ans) + light2(X, Y, 10-ans), 20);

%% THREE 100-WATT BULBS
% Here we going to put 3 bulbs at once.
light3 = inline(vectorize('100/(4*pi*((x - d)^2 + (y - 2)^2 +3^2))'), 'x', 'y', 'd')
%%
% create a grid and plot simple positioning at points |(2, 1)|,
% |(2,5)| and |(2, 9)|
[X,Y] = meshgrid(0:0.1:10, 0:0.1:4); contourf(light3(X, Y, 1) + light3(X, Y, 5) + light3(X, Y, 9), 20);
axis equal tight

%%
% plot intensities along the short wall, at different symmetrical
% positioning of two other bulbs. The third one is placed at center.
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




