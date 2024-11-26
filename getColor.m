function [array_color, I2] = getColor(I, z)
    I2 = imcrop(I,[299+z 64 0 116]);

    array_color{1,1} = 'R';
    array_color{2,1} = 'G';
    array_color{3,1} = 'B';

    for k = 1:1:3
        for j = 1:1:length(I2(:,:,k))
            X = I2(:,:,k);
    
            max = maxx(X(j,:));
            min = minx(X(j,:));
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
    