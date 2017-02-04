function [T,R, lambdas, P1] = rekonstruktion(T1,T2,R1,R2, Korrespondenzen, K)
% Funktion zur Bestimmung der korrekten euklidischen Transformation, der
% Tiefeninformation und der 3D Punkte der Merkmalspunkte in Bild 1
    
    n = length(Korrespondenzen);
    %% Schritt 1: M aufstellen

    % Kalibration 
    Korrespondenzen1 = inv(K)*[Korrespondenzen(1:2, :); ones(1, n)]; % x = inv(K) * x_strich
    Korrespondenzen2 = inv(K)*[Korrespondenzen(3:4, :); ones(1, n)]; % x = inv(K) * x_strich
    %%
    % Bild 1
    % P2 = R*P1 + T
    M11 = [];
    M12 = [];
    row = 1;
    for i=1:n
        x_1 = [Korrespondenzen1(:, i)];
        x_2 = [Korrespondenzen2(:, i)];
        x_2_head = [0 -x_2(3) x_2(2); x_2(3) 0 -x_2(1); -x_2(2) x_2(1) 0];
        
        M11(row:row+2, i)   = x_2_head * R1 * x_1;
        M11(row:row+2, n+1) = x_2_head * T1;
        
        M12(row:row+2, i)   = x_2_head * R2 * x_1;
        M12(row:row+2, n+1) = x_2_head * T2;
        
        row = row + 3;
    end
    
    % Bild 2
    % P1 = R'*P2 - R'*T
    M21 = [];
    M22 = [];
    row = 1;
    for i=1:n
        x_1 = [Korrespondenzen1(:, i)];
        x_2 = [Korrespondenzen2(:, i)];
        x_1_head = [0 -x_1(3) x_1(2); x_1(3) 0 -x_1(1); -x_1(2) x_1(1) 0];
        
        M21(row:row+2, i)   = x_1_head * R1' * x_2;
        M21(row:row+2, n+1) = x_1_head * (-R1'*T1);

        M22(row:row+2, i)   = x_1_head * R2' * x_2;
        M22(row:row+2, n+1) = x_1_head * (-R2'*T2);
        
        row = row + 3;
    end
    
    
    %% Schritt 2: Singul?rwertzerlegung von M
    [U, S, V] = svd(M11);
    min11 = V(:, end);
    [U, S, V] = svd(M12);
    min12 = V(:, end);   
    [U, S, V] = svd(M21);
    min21 = V(:, end);
    [U, S, V] = svd(M22);
    min22 = V(:, end); 
    
    
    pos1 = length(min11(min11(1:end-1) > 0)) + length(min21(min21(1:end-1) > 0));
    pos2 = length(min12(min12(1:end-1) > 0)) + length(min22(min22(1:end-1) > 0));
    
    if(pos1 >= pos2)
        R = R1;
        T = T1;
        lambdas = min11(1:end-1);
    else
        R = R2;
        T = T2;
        lambdas = min12(1:end-1);
    end
    
    P1 = [];
    
    for p=1:n
        pi = lambdas(p) * [Korrespondenzen1(:, p); 1];
        P1(:, end+1) = pi;
    end
    
    [X Y Z] = cylinder([0.4 0]);
    %figure;
    %hold on;
    figure;
    surf(X,Y,Z);
    hold on;
    text(X(1,1), Y(1,1), Z(1,1), 'CF1')
    positionOld1 = [X(1,:)',Y(1,:)',Z(1,:)'];
    positionOld2 = [X(2,:)',Y(2,:)',Z(2,:)'];
    positionNew1 = positionOld1*R;
    positionNew2 = positionOld2*R;

    % reassemble the two sets of points into X Y Z format:
    X = [positionNew1(:,1)+T(1),positionNew2(:,1)];
    Y = [positionNew1(:,2)+T(2),positionNew2(:,2)];
    Z = [positionNew1(:,3)+T(3),positionNew2(:,3)];

    
    surf(X,Y,Z);
    text(X(1,1), Y(1,1), Z(1,1), 'CF2')
    scatter3(P1(1,:), P1(2, :), P1(3, :));
    alpha(.1) % making plots transparent
%     hold on;
%     [x, y, z] = cylinder([1 0]);
% %     p1 = plot3(x, y, z);
% %     rotate(p1, [1 0 0], 0);
% 
%     pos1new = [x(1, :)', y(1,:)', z(1,:)'];
%     pos2new = [x(2, :)', y(2,:)', z(2,:)'];
%     pos1new = pos1new * R ;
%     pos2new = pos1new * R ;
%     
%     x = [pos1new(:, 1), pos2new(:, 1)];
%     y = [pos1new(:, 2), pos2new(:, 2)];
%     z = [pos1new(:, 3), pos2new(:, 3)];
%     
%     p2 = surf(x, y, z);
end