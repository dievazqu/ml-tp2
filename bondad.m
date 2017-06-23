function [R2 r] = bondad(y, yp)
    r = y - yp;
    R2 = 1 - sum(r.^2)/sum((y - mean(y)).^2);
end