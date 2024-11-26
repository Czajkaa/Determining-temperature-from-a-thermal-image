function [I5, Temperature, average] = giveTemp(I, t_min, t_max, x, y, k1, k2)
    [Colors2, ~] = getColor(I, 4);

    for n = 1:1:length(Colors2{1, 2})
        R(n) = im2double(Colors2{1, 2}{n, 2}) * 255;
        G(n) = im2double(Colors2{2, 2}{n, 2}) * 255;
        B(n) = im2double(Colors2{3, 2}{n, 2}) * 255;
    end
    [Colors, ~, ~, ~, ~] = getColor2(R, G, B, 117, 30);

    t_delta = (t_max - t_min) / length(Colors{1, 2});
    Temperature = 0;

    I4 = imcrop(I,[109+x 83+y 3*k1+2 2*k1+2]);
    I4(:,:,:) = 0;  
    I3 = imcrop(I,[110+x 84+y 3*k1 2*k1]);
    

    [A,B] = size(I3(:,:,1));
    for x1 = 1:1:A
        for y1 = 1:1:B
            I2 = I3(x1,y1,:);
            [Red, Green, Blue] = getValue(I2, Colors);
            [Temp] = getTemp(I2, Red, Green, Blue);
            t_point = t_min + (117 - Temp{1,1} - k2*10) * t_delta;
            average(x1,y1) = t_point;
            T(x1,y1) = Temp{1,1};
            if t_point > Temperature
                Temperature = t_point;
                x_c = x1;
                y_c = y1;
                t_c = Temp{1,1} + k2*10;
            end
        end
    end
                       
    for x2 = 1:1:A
        for y2 = 1:1:B                    
            if (T(x2,y2) == T(x_c,y_c))
                I3(x2,y2,:) = 120;
            end
        end
    end

    I5 = I;
    I5(62+t_c,299:306,:) = 0;
    I5(83+y:85+y+2*k1, 109+x:111+x+3*k1,:) = I4;
    I5(84+y:84+y+2*k1, 110+x:110+x+3*k1,:) = I3;
end