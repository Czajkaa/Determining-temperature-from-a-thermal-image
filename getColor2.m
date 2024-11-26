function [array_color, x, y_R, y_G, y_B] = getColor2(Red, Green, Blue, level, delta)
    x = 1:1:length(Red);
    degree = 6;
    c_R = polyfit(x, Red, degree);
    c_G = polyfit(x, Green, degree);
    c_B = polyfit(x, Blue, degree);
    y_R = polyval(c_R, x);
    y_G = polyval(c_G, x);
    y_B = polyval(c_B, x);

    array_color{1,1} = 'R';
    array_color{2,1} = 'G';
    array_color{3,1} = 'B';

    key = {'c_R'; 'c_G'; 'c_B'}; 

    for k = 1:1:3
        for j = 1:1:level
            value = eval(sprintf('polyval(%s, j/1)', key{k}));
            max = uint8(value + delta);
            min = uint8(value - delta);
            if(max > 255)
                max = 255;
            elseif(min < 0)
                min = 0;
            end
            for i = min:1:max
                array(i-min+1) = i;
            end
            R{j,1} = j;
            R{j,2} = array;
            clear max;
            clear min;
            clear array;
        end
        array_color{k,2} = R;
        clear R;
    end
end
    