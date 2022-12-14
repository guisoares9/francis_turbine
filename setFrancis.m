function francis = setFrancis(x) 
    fr = Francis;
    fr.d1 = x(1); fr.d2 = x(2);    
    fr.r1 = x(3); fr.r2 = x(4);
    fr.w  = x(5); fr.b  = x(6);    
    francis = fr;
end