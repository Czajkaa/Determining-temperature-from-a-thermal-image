clear;
close all;
clc;

load("data.mat")
key = {'U_1MHz'; 'U_3MHz'; 'T_4_5Hz'; 'T_50_200Hz'; 'Kontrolna'};
for n = 3:1:3
    dane = eval(sprintf('data.%s', key{n}));
    temp = eval(sprintf('data.%s_T', key{n}));
    
    %% Badania
    x = 21;
    y = 25;
    k1 = 12;

    nn = 2;
    figure

    for j = nn:1:nn
        for i = 1:1:3
            I = imread(sprintf('C:/Users/jacza/OneDrive/Pulpit/Dane/Pomiary/IR_%d.jpg', dane(j,i)));
            I5 = I;

            I4 = imcrop(I,[109+x 83+y 3*k1+2 2*k1+2]);
            [I4_x,I4_y] = size(I4(:,:,1));
            I4(:,:,:) = 0;
            I5(83+y:85+y+2*k1, 109+x:111+x+3*k1,:) = I4;
            
            I3 = imcrop(I,[110+x 84+y 3*k1 2*k1]);
            [I3_x,I3_y] = size(I3(:,:,1));
            I5(84+y:84+y+2*k1, 110+x:110+x+3*k1,:) = I3;

            
            subplot(1,3,i), imshow(I5)
            if(i == 1 || i == 4)
                title('Przed zabiegiem')
            elseif(i == 2 || i == 5)
                title('Po zabiegu')
            elseif(i == 3 || i == 6)
                title('15 min po zabiegu')
            end
        end
    end
end