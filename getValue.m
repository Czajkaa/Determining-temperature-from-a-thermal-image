function [Red, Green, Blue] = getValue(I2,colors)
    R = I2(:,:,1);
    G = I2(:,:,2);
    B = I2(:,:,3);

    for i = 1:1:length(colors{1, 2})
        for j = 1:1:length(colors{1, 2}{i, 2})
            if colors{1, 2}{i, 2}(j) == R
                Red(i,1) = colors{1, 2}{i, 2}(j);
                break
            else
                Red(i,1) = -1;
            end
        end
    end

    for i = 1:1:length(colors{2, 2})
        for j = 1:1:length(colors{2, 2}{i, 2})
            if colors{2, 2}{i, 2}(j) == G
                Green(i,1) = colors{2, 2}{i, 2}(j);
                break
            else
                Green(i,1) = -1;
            end
        end
    end

    for i = 1:1:length(colors{3, 2})
        for j = 1:1:length(colors{3, 2}{i, 2})
            if colors{3, 2}{i, 2}(j) == B
                Blue(i,1) = colors{3, 2}{i, 2}(j);
                break
            else
                Blue(i,1) = -1;
            end
        end
    end

end