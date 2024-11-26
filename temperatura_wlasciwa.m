clear;
close all;
clc;

delta = 30;

%% Wczytane
load("data.mat")

key = {'U_1MHz'; 'U_3MHz'; 'T_4_5Hz'; 'T_50_200Hz'};
for n = 3:1:3
    dane = eval(sprintf('data.%s', key{n}));
    temp = eval(sprintf('data.%s_T', key{n}));
    
    %% Badania
    k1 = 15;
    k2 = 5;
    for j = 5:1:5
        for i = 1:1:1
            I = imread(sprintf('C:/Users/jacza/OneDrive/Pulpit/Dane/Pomiary/IR_%d.jpg', dane(j,i)));
            I3 = imcrop(I,[160-k1 121-k1 3*k1 2*k1]);
            I7 = imcrop(I,[159-k1 120-k1 3*k1+2 2*k1+2]);

            [Colors2, I2] = getColor(I, 4);
            x1 = 1-2*24/117:24/117:24+2*24/117;
            for n = 1:1:length(Colors2{1, 2})
                R(n) = im2double(Colors2{1, 2}{n, 2}) * 255;
                G(n) = im2double(Colors2{2, 2}{n, 2}) * 255;
                B(n) = im2double(Colors2{3, 2}{n, 2}) * 255;
            end
            [Colors, ~, y_R, y_G, y_B] = getColor2(R, G, B, 117, delta);


            t_min = temp(j,2*i); t_max = temp(j,2*i-1);
            t_delta = (t_max - t_min) / length(Colors{1, 2});
            Temperature = 0;


            [A,B] = size(I3(:,:,1));
            for x = 1+k2:1:A-k2
                for y = 1+k2:1:B-k2
                    I4 = I3(x,y,:);
                    [Red, Green, Blue] = getValue(I4, Colors);
                    [Temp] = getTemp(I4, Red, Green, Blue);
                    t_point = t_min + (117 - Temp{1,1}) * t_delta;
                    T(x,y) = Temp{1,1};
                    if t_point > Temperature
                        Temperature = t_point;
                        x_c = x;
                        y_c = y;
                        t_c = Temp{1,1};
                        i = i+1;
                    end
                end
            end

            I5 = I3;
                       
            for x = 1+k2:1:A-k2
                for y = 1+k2:1:B-k2                    
                    if (T(x,y) == T(x_c,y_c))
                        I5(x,y,:) = 0;
                    end
                end
            end

            I6 = I;
            I7(:,:,:) = 0;
            I6(62+t_c,299:306,:) = 0;
            I6(121-k1:153-k1,160-k1:207-k1,:) = I7;
            I6(122-k1:152-k1,161-k1:206-k1,:) = I5;

            figure
            x = 2;
            y = 2;
            sgtitle(sprintf("%.2f", Temperature))
            subplot(x,y,1), imshow(I)
            subplot(x,y,2), imshow(I6)
            subplot(x,y,3), imshow(I3)
            subplot(x,y,4), imshow(I5)
        end
    end
end