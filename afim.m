function retValue = afim(v,w,T)
    baseVector = [v w 1];
    result = baseVector * T;
    retValue = [result(1) result(2)];
end