% Vervollständigen Sie das folgende Skript:
clc, clear all;
Image = imread('bild.png');

l1 = [1; -10; 740];
l2 = [2; 5; -1470];

p1 = [125; 214];
p2 = [200; 354];
p3 = [124; 150];
p4 = [292; 118];
p5 = [244; 191];
p6 = [68; 255];
p7 = [131; 399];
p8 = [35; 109];
p9 = [113; 358];
p10 = [54; 223];

%% Aufgabe 1
figure, imshow(Image); 
sz = size(Image);
j = 1:sz(2);

x_l1 = 1/l1(1)*(-l1(2)*j - l1(3));
x_l2 = 1/l2(1)*(-l2(2)*j - l2(3));

% plot
hold on
plot(x_l1, j, '-ob');
plot(x_l2, j, '-xr');
hold off

%% Aufgabe 2

imshow(Image);
X = [p1(1) p2(1)];
Y = [p1(2) p2(2)];
line(X,Y, 'Color', 'r', 'LineWidth', 4), title('Red line from eq. 2');
hold on, line(x_l1, j, 'Color', 'y', 'LineWidth', 4), title('Red line from eq. 2');
line(x_l2, j, 'Color', 'g', 'LineWidth', 4), title('Red line from eq. 2');
hold off

%% Aufgabe 3 







