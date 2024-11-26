function [value] = minx(x)
    value = 260;
    for i = 1:1:length(x)
        if x(1,i) < value
            value = x(1,i);
        end
    end
end