function [T1,R1,T2,R2] = TR_aus_E(E)
% In dieser Funktion sollen die moeglichen euklidischen Transformationen
% aus der Essentiellen Matrix extrahiert werden
    [U,S,V] = svd(E);

    RZ_PLUS = [0 -1 0;1 0 0;0 0 1];
    RZ_MINUS = [0 1 0;-1 0 0;0 0 1];
    R1 = U * RZ_PLUS' * V';
    R2 = U * RZ_MINUS' * V';

    T1_dach = U * RZ_PLUS  * S * U';
    T2_dach = U * RZ_MINUS * S * U';
    
    T1 = [T1_dach(3, 2); T1_dach(1,3); T1_dach(2,1)];
    T2 = [T2_dach(3, 2); T2_dach(1,3); T2_dach(2,1)];
end