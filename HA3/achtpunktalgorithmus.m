function [EF] = achtpunktalgorithmus(Korrespondenzen,K)
% Diese Funktion berechnet die Essentielle Matrix oder Fundamentalmatrix
% mittels 8-Punkt-Algorithmus, je nachdem, ob die Kalibrierungsmatrix 'K'
% vorliegt oder nicht
if (isempty(K))
    % 8-Punktealgorithmus
    A=[];
    for n=1:size(Korrespondenzen,2)
        point_x1 = Korrespondenzen(1:2,n);
        point_x2 = Korrespondenzen(3:4,n);
        A(end+1,:) = kron(point_x1,point_x2)';
    end
    % 1.Singulaerwertzerlegung: von A
    [U,S,V] = svd(A);
    G_stacked = V(:,end);
    G = [G_stacked(1:2,:) G_stacked(3:4,:)];
    
    % 2. Singulaerwertzerlegung: von G
    [UG,SG,VG] = svd(G);
    
    % E berechnen
    E = UG * [1 0; 0 1] * VG;
else
    % Fundamentalmatrix berechnen
end


end