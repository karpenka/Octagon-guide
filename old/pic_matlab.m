bb=-1.5:3/99:1.5;
aa=-0.1:0.2/99:0.1;
[X,Y]=meshgrid(aa,bb);
figure;
surf(X,Y,data)
xlabel('x [m]')
ylabel('vert. divergence [deg]')
title(strjoin({'lambda = 2',char(197),', height = 20 cm, length = 30 m'}))