clear;
close all;
clc;

%% Wczytane
load("data.mat")

key = {'U_1MHz'; 'U_3MHz'; 'T_4_5Hz'; 'T_50_200Hz'};
n = 3;

dane = eval(sprintf('data.%s', key{n}));
temp = eval(sprintf('data.%s_T', key{n}));

%% Badania
i = 2;
j = 1;
I = imread(sprintf('C:/Users/jacza/OneDrive/Pulpit/Dane/Pomiary/IR_%d.jpg', dane(j,i)));
I2 = imcrop(I,[160 120 0 0]);
I3 = I;
I3(120:130,160:170,:) = 0;

[Colors] = getColor(I);
[Red, Green, Blue] = getValue(I2, Colors);
[Temp] = getTemp(I2, Red, Green, Blue);

figure
x = 1;
y = 2;

subplot(x,y,1), imshow(I3)
subplot(x,y,2), imshow(I2)