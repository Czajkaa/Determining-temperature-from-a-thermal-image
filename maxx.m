function [value] = maxx(x)
    value = 0;
    for i = 1:1:length(x)
        if x(1,i) > value
            value = x(1,i);
        end
    end
end