clear;
close all;
clc;

level = 117;
delta = 30;

%% Skala
I = imread('C:/Users/jacza/OneDrive/Pulpit/Dane/Pomiary/IR_1324.jpg');
[Colors2, I2] = getColor(I, 4);
x1 = 1-2*24/117:24/117:24+2*24/117;
for i = 1:1:length(Colors2{1, 2})
    Red(i) = im2double(Colors2{1, 2}{i, 2}) * 255;
    Green(i) = im2double(Colors2{2, 2}{i, 2}) * 255;
    Blue(i) = im2double(Colors2{3, 2}{i, 2}) * 255;
end


% Red = [237.5 237.5 237.5 237.5 237.5 237.5 237.5 237.5 237.5 237.5 237.5 215 195 165 125 67.5 20 7.5 5 5 5 2.5 2.5 0];
% Green = [237.5 215 175 120 70 37.5 80 130 170 195 210 215 200 180 165 145 125 110 95 75 57.5 37.5 15 5];
% Blue = [237.5 195 145 115 92.5 70 50 35 27.5 17.5 7.5 5 5 15 57.5 127.5 185 205 195 170 140 115 90 85];


%% Macierz skali
[Colors, x, y_R, y_G, y_B] = getColor2(Red, Green, Blue, level, delta);

for i = 1:1:level
        y_R_k_min(i) = Colors{1, 2}{i, 2}(1);
        y_R_k_max(i) = Colors{1, 2}{i, 2}(length(Colors{1, 2}{i, 2}));

        y_G_k_min(i) = Colors{2, 2}{i, 2}(1);
        y_G_k_max(i) = Colors{2, 2}{i, 2}(length(Colors{2, 2}{i, 2}));

        y_B_k_min(i) = Colors{3, 2}{i, 2}(1);
        y_B_k_max(i) = Colors{3, 2}{i, 2}(length(Colors{3, 2}{i, 2}));
end

figure
subplot(3,1,1), plot(x,Red, 'LineWidth', 1, 'Color', [0.4940 0.1840 0.5560]), hold on;
plot(x,y_R, 'LineWidth', 1, 'Color', 'k', 'Color', 'c')
plot(x,y_R_k_min, '--', 'LineWidth', 3, 'Color', 'k')
plot(x,y_R_k_max, '--', 'LineWidth', 3, 'Color', 'k')
ylim([0 265])
title('Czerwony (R)')
xlabel('Poziom skali temperturowej')
h = ylabel('Składowe koloru');
pos = get(h, 'Position');
pos(1) = pos(1) + 2;
set(h, 'Position', pos);
legend('Średnie wartości danych','Wyznaczona funkcja', 'Granica')
grid on;
subplot(3,1,2), plot(x, Green, 'LineWidth', 1, 'Color', [0.4940 0.1840 0.5560]), hold on;
plot(x,y_G, 'LineWidth', 1, 'Color', 'c')
plot(x,y_G_k_min, '--', 'LineWidth', 3, 'Color', 'k')
plot(x,y_G_k_max, '--', 'LineWidth', 3, 'Color', 'k')
ylim([0 265])
title('Zielony (G)')
xlabel('Poziom skali temperturowej')
h = ylabel('Składowe koloru');
pos = get(h, 'Position');
pos(1) = pos(1) + 2;
set(h, 'Position', pos);
legend('Średnie wartości danych','Wyznaczona funkcja', 'Granica')
grid on;
subplot(3,1,3), plot(x,Blue, 'LineWidth', 1, 'Color', [0.4940 0.1840 0.5560]), hold on;
plot(x,y_B, 'LineWidth', 1, 'Color', 'c')
plot(x,y_B_k_min, '--', 'LineWidth', 3, 'Color', 'k')
plot(x,y_B_k_max, '--', 'LineWidth', 3, 'Color', 'k')
ylim([0 265])
title('Niebieski (B)')
xlabel('Poziom skali temperturowej')
h = ylabel('Składowe koloru');
pos = get(h, 'Position');
pos(1) = pos(1) + 2;
set(h, 'Position', pos);
legend('Średnie wartości danych','Wyznaczona funkcja', 'Granica')
grid on;





