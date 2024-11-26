function [Temp] = getTemp(I2, Red, Green, Blue)
    for i = 1:1:117
        if Red(i) == I2(:,:,1) && Green(i) == I2(:,:,2) && Blue(i) == I2(:,:,3)
            Temp1{i,1} = 1;
        else
            Temp1{i,1} = 0;
        end
    end
    
    k = 1;
    for i = 1:1:117
        if Temp1{i,1} == 1
            Temp{k,1} = i;
            k = k + 1;
        else
            Temp{k,1} = 117;
        end
    end
end