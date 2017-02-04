function repro_error = rueckprojektion(Korrespondenzen, P1, I2, T, R, K)
% Diese Funktion berechnet die projizierten Punkte in Kamera 2 und den
% mittleren Rueckprojektionsfehler

n_points = size(P1,2);
x2_repro = [];
R_dash = K*R*K^-1;
T_dash = K*T;
M = [R T; 0 0 0 1];


for i = 1:n_points
    x2_repro(:,end+1) = [K zeros(size(K,1),1)]*M*P1(:,i);
    
end

% Scale out z
x2_repro(1, :) = x2_repro(1,:)./x2_repro(3,:);
x2_repro(2, :) = x2_repro(2,:)./x2_repro(3,:);

close all;

subplot(2,1,1)
subimage(I2);

for j = 1:2
    subplot(2,1,j)
    hold on;
    scatter(-x2_repro(1,:),x2_repro(2,:),'r');
    scatter(Korrespondenzen(3,:),Korrespondenzen(4,:),'g');

    for i=1:n_points
        plot([-x2_repro(1,i) Korrespondenzen(3,i)],[x2_repro(2,i) Korrespondenzen(4,i)], 'b')
    end
end




repro_error = 0;

for i = 1:n_points
   err = dist(Korrespondenzen(3:4,i), x2_repro(1:2,i));
   repro_error = repro_error + err(1);
end

repro_error = repro_error / n_points;

end